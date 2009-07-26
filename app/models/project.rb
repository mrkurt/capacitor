require 'lib/strings'

class Project < ActiveRecord::Base
  has_one :bounty
  belongs_to :user
  belongs_to :url
  has_many :categories, :class_name => 'ProjectCategory', :dependent => :destroy, :include => :category
  
  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :description
  validates_associated :bounty
  
  validate :must_be_funded
  
  before_validation :sanity_check_bounty
  before_validation :choose_project_status
  
  def category_names
    categories.map{ |c| c.display_name }.join(', ')
  end
  
  def accepting_pledges?
    status == 'draft' || status == 'live'
  end

  def category_names=(values)
    categories.clear
    names = values.split(',')
    names.each_with_index do |n, i|
      n2 = n.strip
      slug = StringUtilities.make_slug(n2)
      c = Category.find(:first, :conditions => ['name = ? or slug = ?', n2, slug])
      c = Category.create(:name => n2, :slug => slug) if c.nil?
      pc = ProjectCategory.new(:display_name => n2, :rank => i)
      pc.category = c
      categories << pc
    end
  end
  
  protected

  def sanity_check_bounty
    if self.bounty.nil?
      self.bounty = Bounty.new(:amount => 100, :raised => 0, :expires_at => DateTime.now + 7)
    end
    true
  end
  
  def choose_project_status
    if bounty.pledges.total < (bounty.amount / 10) && self.status != 'banned'
      self.status = 'draft'
    end
    if bounty.pledges.total >= (bounty.amount / 10) && self.status != 'banned'
      self.status = 'live'
    end
    if bounty.pledges.total >= bounty.amount && self.status != 'banned'
      self.status = 'funded'
    end
    true
  end
  
  def must_be_funded
    if status == 'live' && (bounty.nil? || (bounty.pledges.total < bounty.amount / 10))
      errors.add_to_base("Project must be funded to 10% to be live")
    end
  end
end

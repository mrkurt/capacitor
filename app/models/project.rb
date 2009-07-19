class Project < ActiveRecord::Base
  has_one :bounty
  belongs_to :user
  belongs_to :url
  
  validates_presence_of :user_id
  validates_associated :bounty
  
  validate :must_be_funded
  
  def before_validation
    if self.bounty.nil?
      self.bounty = Bounty.new(:amount => 200, :raised => 0, :expires_at => DateTime.now + 7)
      true
    end
  end
  
  protected
  
  def must_be_funded
    if status == :live && (bounty.nil? || bounty.pledges.select{|p| p.user_id = user_id && p.amount >= (bounty.amount / 10)}.length < 1)
      errors.add_to_base("Project must be funded to 10% by creator to make live")
    end
  end
end

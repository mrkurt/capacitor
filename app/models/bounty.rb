class Bounty < ActiveRecord::Base
  belongs_to :project, :touch => :last_pledge_at
  has_many :pledges, :dependent => :destroy do
    def total
      inject(0) {|sum, s| sum += s.amount}
    end
  end
  
  def remaining(options = {:format => :number, :target_percent => 100})
    if options[:format] == :percent
      (100 - (raised :format => :percent)).to_i
    else
      options[:target_percent] ||= 100
      (amount / 100 * options[:target_percent]) - pledges.total
    end
  end
  
  def raised(options = {:format => :number})
    if options[:format] == :percent
      (pledges.total / amount * 100).to_i
    else 
      pledges.total
    end
  end
  
  validates_numericality_of :amount, :greater_than => 0
end

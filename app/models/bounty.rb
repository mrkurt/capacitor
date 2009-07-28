class Bounty < ActiveRecord::Base
  belongs_to :project, :touch => :last_pledge_at
  has_many :pledges, :dependent => :destroy do
    def total
      inject(0) {|sum, s| sum += s.amount}
    end
  end
  
  def remaining(options = {:format => :number, :target_percent => 100})
    if options[:format] == :percent
      ((amount - pledges.total) / pledges.total).to_i
      return 999
    else
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

class Bounty < ActiveRecord::Base
  belongs_to :project, :touch => :last_pledge_at
  has_many :pledges, :dependent => :destroy do
    def total
      inject(0) {|sum, s| sum += s.amount}
    end
  end
  
  validates_numericality_of :amount, :greater_than => 0
end

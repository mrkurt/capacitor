class Bounty < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  
  validates_numericality_of :amount, :greater_than => 0
end

class Pledge < ActiveRecord::Base
  belongs_to :bounty, :touch => :last_pledge_at
  belongs_to :user
  belongs_to :credit
  
  before_create :create_credit
  validates_presence_of :user_id
  validate :no_excess_pledges
  validate :user_must_have_funds
  
  protected
  
  def create_credit
    c = Credit.new
    c.user = self.user
    c.amount = 0 - self.amount
    self.credit = c
    c.save
  end
  
  def user_must_have_funds
    if self.user.available_credit < self.amount
      errors.add_to_base("User does not have enough credits available to make this pledge")
    end
  end
  
  def no_excess_pledges
    if self.bounty.remaining < self.amount
      self.amount = self.bounty.remaining
    end
  end
end

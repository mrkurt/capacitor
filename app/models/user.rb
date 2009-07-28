class User < ActiveRecord::Base
  has_many :credits, :dependent => :destroy
  has_many :projects
  def available_credit
    Credit.sum(:amount, :conditions => ['user_id = ?', self.id])
  end
end

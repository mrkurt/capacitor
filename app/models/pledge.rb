class Pledge < ActiveRecord::Base
  belongs_to :bounty, :touch => :last_pledge_at
  belongs_to :user
end

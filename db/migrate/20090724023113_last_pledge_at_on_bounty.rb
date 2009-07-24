class LastPledgeAtOnBounty < ActiveRecord::Migration
  def self.up
    add_column :bounties, :last_pledge_at, :datetime
    add_column :projects, :last_pledge_at, :datetime
  end

  def self.down
    drop_column :bounties, :last_pledge_at
    drop_column :projects, :last_pledge_at
  end
end

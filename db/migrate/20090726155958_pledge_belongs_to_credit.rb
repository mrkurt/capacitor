class PledgeBelongsToCredit < ActiveRecord::Migration
  def self.up
    add_column :pledges, :credit_id, :integer
  end

  def self.down
    drop_column :pledges, :credit_id
  end
end

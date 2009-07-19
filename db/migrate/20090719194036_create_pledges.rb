class CreatePledges < ActiveRecord::Migration
  def self.up
    create_table :pledges do |t|
      t.decimal :amount, :null => false
      t.belongs_to :bounty
      t.belongs_to :user
      t.timestamps
    end
  end

  def self.down
    drop_table :pledges
  end
end

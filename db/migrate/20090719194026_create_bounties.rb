class CreateBounties < ActiveRecord::Migration
  def self.up
    create_table :bounties do |t|
      t.decimal :amount, :null => false
      t.decimal :raised, :null => false
      t.datetime :expires_at, :null => false
      t.belongs_to :project
      t.timestamps
    end
    
    add_index :bounties, :project_id, :unique => true
  end

  def self.down
    drop_table :bounties
  end
end

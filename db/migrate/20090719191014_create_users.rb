class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :null => false
      t.string :name, :null => false
      t.string :password, :null => false
      t.timestamps
    end
    
    add_index :users, :email, :unique => true
    add_index :users, :name, :unique => true
  end

  def self.down
    drop_table :users
  end
end

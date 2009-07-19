class CreateUrls < ActiveRecord::Migration
  def self.up
    create_table :urls do |t|
      t.string :path, :null => false
      t.timestamps
    end
    
    add_index :urls, :path, :unique => true
  end

  def self.down
    drop_table :urls
  end
end

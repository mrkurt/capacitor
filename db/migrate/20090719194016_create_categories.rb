class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name, :null => false
      t.string :path
      t.integer :parent_id, :null => true
      t.belongs_to :url
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end

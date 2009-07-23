class CreateProjectCategories < ActiveRecord::Migration
  def self.up
    create_table :project_categories do |t|
      t.string :display_name
      t.integer :rank, :default => 100
      t.belongs_to :project
      t.belongs_to :category
    end
  end

  def self.down
    drop_table :project_categories
  end
end

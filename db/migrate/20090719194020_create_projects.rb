class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      t.datetime :accepted_at
      t.datetime :expires_at
      t.datetime :completed_at
      t.string :status, :default => 'draft'
      t.belongs_to :user
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
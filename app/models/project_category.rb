class ProjectCategory < ActiveRecord::Base
  belongs_to :project
  belongs_to :category
  
  validates_presence_of :project_id
  validates_presence_of :category_id
  
  def name
    category.name
  end
  
  def slug
    category.slug
  end
  
end

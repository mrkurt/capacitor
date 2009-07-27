class ProjectCategory < ActiveRecord::Base
  belongs_to :project
  belongs_to :category
  
  def name
    category.name
  end
  
  def slug
    category.slug
  end
  
end

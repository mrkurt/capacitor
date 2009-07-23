require 'lib/strings'

class Category < ActiveRecord::Base
  belongs_to :url
  has_many :projects, :class_name => 'ProjectCategory', :dependent => :destroy, :include => :project
  before_save :clean_slug
  
  def clean_slug
    self.slug = self.name if slug.nil?
    self.slug = StringUtilities.make_slug(self.slug)
  end
end

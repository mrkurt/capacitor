class Project < CouchRestRails::Document
  property :title
  property :description
  property :categories
  property :duration
  property :status
  
  property :creator_id
end
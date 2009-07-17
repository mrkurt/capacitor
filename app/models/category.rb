class Category < CouchRestRails::Document
  property :name
  property :path
  property :parent_id
end
class User < CouchRestRails::Document
  unique :email
  property :email
  property :name
end
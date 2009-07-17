class Pledge < CouchRestRails::Document
  property :bounty_id
  property :user_id
  property :amount
end
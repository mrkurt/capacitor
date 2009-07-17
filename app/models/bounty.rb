class Bounty < CouchRestRails::Document
  property :starts_at
  property :expires_at
  property :target_id
  property :amount
end
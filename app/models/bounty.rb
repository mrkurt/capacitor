class Bounty < CouchRest::ExtendedDocument
  property :starts_at
  property :expires_at
  property :target_id
  property :amount
end
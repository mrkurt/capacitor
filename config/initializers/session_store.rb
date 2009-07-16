# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_resistor_session',
  :secret      => '851e818c61a5e2c56a175c8843614ebb463b855342991dbde8095543747da198758036c0b049cf3001d0c839b7723a00b2e7a5013b6d17fc01d12d71f07bc6d8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

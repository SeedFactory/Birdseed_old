# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
  config.use_s3 = true
  config.s3_access_key = ENV['AWS_ACCESS_KEY_ID']
  config.s3_secret = ENV['AWS_SECRET_ACCESS_KEY']
  config.s3_bucket = 'birdseed'
end

Spree.user_class = "Spree::User"

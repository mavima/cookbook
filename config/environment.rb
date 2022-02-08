# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :user_name => 'info@recipeper.com', 
  :password => ENV["SENDGRID_API_KEY"], # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'https://recipepers.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: 'apikey',
  password: ENV["SENDGRID_API_KEY"],

  domain: 'recipeper.com',
  enable_starttls_auto: true
}

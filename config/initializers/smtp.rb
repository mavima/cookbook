ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: 'apikey',
  password: ENV["SENDGRID_API_KEY"],

  domain: 'famtravel.eu',
  enable_starttls_auto: true
}

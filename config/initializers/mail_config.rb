ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'skydai852@gmail.com',
  password: '19921215',
  authentication: 'plain',
  enable_starttls_auto: true
}

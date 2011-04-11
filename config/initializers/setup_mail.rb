ActionMailer::Base.smtp_settings = {
  :addresss => 'localhost', 
  :port     => 25,
  :domain   => 'YOURDOMAINNAME.COM'
  # no SMTP authentication 
}
ActionMailer::Base.default_url_options[:host] = "YOURHOST"


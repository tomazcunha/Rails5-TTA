class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'  # poderia ser noreply@example.com
  layout 'mailer'                   # referece a app/views/layouts/mailer.html.erb
end

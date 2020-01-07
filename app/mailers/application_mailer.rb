class ApplicationMailer < ActionMailer::Base
  default from: 'strikeforceraks@gmail.com'
  layout 'mailer'

  def send_nicole_email(data, email, subject)
    @body=data
    @from_email=email
    mail(from: email, to: 'nicolehallbooks@gmail.com', subject: subject)
  end
end

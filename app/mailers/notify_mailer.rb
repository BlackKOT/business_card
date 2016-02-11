class NotifyMailer < ActionMailer::Base
  default from: 'rediska@blabla.com'
  layout 'mailer'

  def comment_notify(comment)
    @comment = comment
    mail(to: ENV['GMAIL_USERNAME'], subject: '!!!!!New comment')
  end
end
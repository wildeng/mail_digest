class MailDigestMailer < ApplicationMailer
  default from: 'noreply@exasmple.com'

  def digest_update(user)
    @user = user
    @digests = user.mail_digests
    mail(to: @user.email, subject: 'Your digest selection')
  end
end

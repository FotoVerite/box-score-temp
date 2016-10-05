class AccountRequestsMailer < ActionMailer::Base
  default from: Devise.mailer_sender

  def account_request(account_request)
    @account_request = account_request

    email = account_request.spam? ? 'info+spam@hsboxscoresnyc.com' : 'info@hsboxscoresnyc.com'

    mail to: email,
         subject: 'Account Request from HSBoxScoresNYC.com'
  end
end

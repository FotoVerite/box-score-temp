class AccountRequestsMailer < ActionMailer::Base
  default from: Devise.mailer_sender

  def account_request(account_request)
    @account_request = account_request

    mail to: 'info@hsboxscoresnyc.com', from: account_request.applicant_email,
    subject: 'Account Request from HSBoxScoresNYC.com'
  end
end

require 'rails_helper'

describe EmailGateway do
  let(:mailer) { EmailGateway.new }

  describe 'subscribe(email)' do
    it 'subscribes the email to the mailing list' do
      VCR.use_cassette('mailchimp-valid-email') do
        mailer.subscribe('validemail@email.com')
      end

      expect(mailer.success?).to eq true
      expect(mailer.errors).to eq []
    end

    it 'adds errors on an invalid email' do
      VCR.use_cassette('mailchimp-invalid-email') do
        mailer.subscribe('user@example.com')
      end

      expect(mailer.success?).to eq false
      expect(mailer.errors).to include 'This email address looks fake or invalid. Please enter a real email address'
    end

    it 'adds errors on an invalid list id' do
      VCR.use_cassette('mailchimp-invalid-id') do
        mailer.subscribe('validemail@email.com', list_id: '12345')
      end

      expect(mailer.success?).to eq false
      expect(mailer.errors).to include 'Invalid MailChimp List ID: 12345'
    end
  end
end

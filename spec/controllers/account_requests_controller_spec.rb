require 'spec_helper'

describe AccountRequestsController do
  describe 'POST' do
    it "emails the spam filter and does not create an account request when content is spam" do
      VCR.use_cassette('akismet spam', record: :none) do
        ActionMailer::Base.delivery_method = :test
        @request.env['REMOTE_ADDR'] = '10.0.1.74'

        post :create, account_request: (FactoryGirl.attributes_for :account_request)

        email = ActionMailer::Base.deliveries.last
        expect(email.to).to eq ["info+spam@hsboxscoresnyc.com"]
        expect(AccountRequest.count).to eq 0
      end
    end

    it 'sends an email and creates an account request when content is NOT spam' do
      VCR.use_cassette('akismet not spam', record: :none) do
        ActionMailer::Base.delivery_method = :test
        @request.env['REMOTE_ADDR'] = '10.0.1.74'
        post :create, account_request: (FactoryGirl.attributes_for :account_request)

        email = ActionMailer::Base.deliveries.last
        expect(email.to).to eq ["info@hsboxscoresnyc.com"]
        expect(AccountRequest.count).to eq 1
      end
    end
  end
end
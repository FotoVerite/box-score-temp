require 'rails_helper'

describe AccountRequestsController do
  describe 'POST' do
    it 'emails the spam filter and does not create an account request when content is spam' do
      ActionMailer::Base.delivery_method = :test
      AccountRequest.any_instance.should_receive(:spam?).twice { true }

      post :create, params: { account_request: (FactoryBot.attributes_for :account_request) }

      email = ActionMailer::Base.deliveries.last
      expect(email.to).to eq ['info+spam@hsboxscoresnyc.com']
      expect(AccountRequest.count).to eq 0
    end
  end

  it 'sends an email and creates an account request when content is NOT spam' do
    ActionMailer::Base.delivery_method = :test
    AccountRequest.any_instance.should_receive(:spam?).twice { false }

    post :create, params: { account_request: (FactoryBot.attributes_for :account_request) }

    email = ActionMailer::Base.deliveries.last
    expect(email.to).to eq ['info@hsboxscoresnyc.com']
    expect(AccountRequest.count).to eq 1
  end
end

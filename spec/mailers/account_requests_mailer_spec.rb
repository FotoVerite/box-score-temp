require "spec_helper"

describe AccountRequestsMailer do
  describe 'new account request' do
    let(:account_request) { create :account_request }
    let(:mailer) { AccountRequestsMailer.account_request(account_request) }

    it 'has the proper subject' do
      mailer.subject.should == 'Account Request from HSBoxScoresNYC.com'
    end

    it 'has the proper from address' do
      mailer.from.should == ['info@hsboxscoresnyc.com']
    end

    it 'has the proper to address' do
      mailer.to.should == ['info@hsboxscoresnyc.com']
    end
  end
end

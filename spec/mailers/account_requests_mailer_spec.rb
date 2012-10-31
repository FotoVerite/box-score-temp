require "spec_helper"

describe AccountRequestsMailer do
  describe 'new account request' do
    let(:params) { 'subject' => 'Message from HSBoxScore.com' }
    let(:account_request) { AccountRequest.new(params) }

    it 'has the proper subject' do
      account_request.subject.should == 'Message from HSBoxScore.com'
    end

    it 'has the proper from address'
  end
end

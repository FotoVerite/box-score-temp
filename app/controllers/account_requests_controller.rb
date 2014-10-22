class AccountRequestsController < ApplicationController
  def create
    @account_request = AccountRequest.new(params[:account_request])

    if @account_request.spam? || @account_request.save
      AccountRequestsMailer.account_request(@account_request).deliver
      render partial: 'shared/thank_you', status: :created
    else
      render partial: 'shared/request_form', status: :unprocessable_entity
    end
  end
end


class AccountRequestsController < ApplicationController
  def create
    @account_request = AccountRequest.new(account_request_params)

    if @account_request.spam? || @account_request.save
      AccountRequestsMailer.account_request(@account_request).deliver
      render partial: 'shared/thank_you', status: :created
    else
      render partial: 'shared/request_form', status: :unprocessable_entity
    end
  end

  private

  def account_request_params
    params.require(:account_request).permit(
      :applicant_name,
      :applicant_email,
      :applicant_phone,
      :applicant_position,
      :message,
      :school_name,
      :school_address,
      :school_assn,
      :school_league
    )
  end
end

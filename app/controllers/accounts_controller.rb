class AccountsController < ApplicationController
  before_filter :authenticate_admin!

  def edit
    @admin = Admin.find(current_admin)
  end

  def update
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].delete("password")
      params[:admin].delete("password_confirmation")
    end

    @admin = Admin.find(current_admin)
    if @admin.update_attributes params[:admin]
      sign_in @admin, bypass: true
      redirect_to root_path
    else
      render action: :edit
    end
  end
end

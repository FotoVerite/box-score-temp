class AccountsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @admin = Admin.find(current_admin.id)
  end

  def update
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].delete('password')
      params[:admin].delete('password_confirmation')
    end

    @admin = Admin.find(current_admin)
    if @admin.update_attributes admin_params
      sign_in @admin, bypass: true
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(
      :email,
      :fist_name,
      :last_name,
      :password,
      :password_confirmation
    )
  end

end



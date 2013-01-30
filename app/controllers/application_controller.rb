class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_subdomain

  rescue_from CanCan::AccessDenied do |exception|
    render text: 'Unauthorized', status: :unauthorized
  end

  def after_sign_in_path_for(admin)
    if admin.sign_in_count == 1
      flash[:alert] = 'Please confirm your account details and change your password.'
      edit_account_path
    else
      school_path(admin.school)
    end
  end

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end

  def authenticate_admin_user!
    redirect_to '/' unless current_admin.try(:superadmin?)
  end

  def ensure_subdomain
    if request.get? && request.subdomain != 'www' && request.host != 'localhost' && !Rails.env.test?
      redirect_to subdomain: 'www', status: :moved_permanently
    end
  end
end

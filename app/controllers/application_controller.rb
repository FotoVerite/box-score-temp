class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_subdomain
  around_filter :set_time_zone

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

  def current_school
    @current_school ||= begin
      if superadmin_signed_in?
        if session[:current_school_id].present?
          School.find(session[:current_school_id])
        else
          current_school = School.ordered.first
        end
      elsif admin_signed_in?
        current_admin.school
      else
        nil
      end
    end
  end
  helper_method :current_school

  def current_school=(school)
    @current_school = school
    session[:current_school_id] = school.id
  end

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end

  def superadmin_signed_in?
    admin_signed_in? && current_admin.superadmin?
  end
  helper_method :superadmin_signed_in?

  def authenticate_superadmin!
    redirect_to '/' unless superadmin_signed_in?
  end

  def ensure_subdomain
    if request.get? && request.subdomain != 'www' && request.host != 'localhost' && !Rails.env.test?
      redirect_to subdomain: 'www', status: :moved_permanently
    end
  end

  def set_time_zone
    old_time_zone = Time.zone
    Time.zone = 'Eastern Time (US & Canada)'
    yield
  ensure
    Time.zone = old_time_zone
  end
end

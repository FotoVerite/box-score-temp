class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, alert: exception.message
  end

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end
end

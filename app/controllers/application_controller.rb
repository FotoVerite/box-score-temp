class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    render text: 'Unauthorized', status: :unauthorized
  end

  def after_sign_in_path_for(admin)
    school_path(admin.school_id)
  end

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end
end

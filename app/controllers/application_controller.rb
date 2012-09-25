class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end
end

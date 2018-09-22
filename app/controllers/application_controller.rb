class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |_exception|
    render plain: 'Unauthorized', status: :unauthorized
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
    current_admin.try(:superadmin?)
  end
  helper_method :superadmin_signed_in?

  def authenticate_superadmin!
    redirect_to '/' unless superadmin_signed_in? || current_admin.try(:sub_editor?)
  end

  def events_to_track
    @_events_to_track ||= []
  end
  helper_method :events_to_track

  def track_event(name, data = {})
    events_to_track.push(
      name: name,
      data: data
    )
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

end

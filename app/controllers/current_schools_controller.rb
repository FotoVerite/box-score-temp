class CurrentSchoolsController < ApplicationController
  before_action :authenticate_superadmin!

  def edit
    @schools = School.ordered
  end

  def update
    self.current_school = School.find(params[:school_id])
    redirect_to root_path
  end
end

class SchoolsController < ApplicationController
  before_filter :authenticate_admin!

  def show
    @school = School.find(params[:id])
    authorize! :show, @school
  end

  def edit
    @school = School.find(params[:id])
    authorize! :edit, @school
  end
end

class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    authorize! :show, @school
  end

  def edit
    @school = School.find(params[:id])
    authorize! :edit, @school
  end
end

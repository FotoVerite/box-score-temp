class SchoolsController < ApplicationController
  respond_to :html

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

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      redirect_to school_path(@school)
    else
      redirect_to edit_school_path(@school)
    end
  end
end

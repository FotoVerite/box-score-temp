class SchoolsController < ApplicationController
  def show
    @school = School.find(params[:id])
    authorize! :show, @school
  end
end

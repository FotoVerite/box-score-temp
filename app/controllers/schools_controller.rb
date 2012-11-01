class SchoolsController < ApplicationController
  respond_to :html

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    authorize! :show, @school

    @unpublished_games = @school.games.unpublished
    @games = @school.games.latest.published.limit(6)
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
      render action: 'edit'
    end
  end
end

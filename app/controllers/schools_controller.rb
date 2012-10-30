class SchoolsController < ApplicationController
  respond_to :html

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    authorize! :show, @school

    school_teams = @school.teams
    scope = Game.latest
    scope = scope.where('team_id in (:teams) or opponent_id in (:teams)', teams: school_teams).limit(6)

    @games = scope
  end

  def edit
    @school = School.find(params[:id])
    authorize! :edit, @school
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(params[:school])
      render action: 'show'
    else
      render action: 'edit'
    end
  end
end

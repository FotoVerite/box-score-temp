class TeamsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @teams = current_admin.school.teams

    league = League.find(params[:league_id])

    respond_to do |format|
      format.json do
        render json: league.teams
      end
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_admin.school.teams.build params[:team]
    if @team.save
      redirect_to [:edit, @team]
    end
  end

  def edit
    @team = current_admin.school.teams.find params[:id]
  end

  def update
    @team = current_admin.school.teams.find params[:id]
    if @team.update_attributes params[:team]
      redirect_to [:edit, @team]
    end
  end

  def destroy
    @team = current_admin.school.teams.find params[:id]
    if @team.destroy
      redirect_to teams_path
    end
  end
end

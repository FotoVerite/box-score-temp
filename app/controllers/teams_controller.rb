class TeamsController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]

  def index
    if admin_signed_in?
      @teams = current_admin.school.teams
    end

    respond_to do |format|
      format.json do
        league = League.find(params[:league_id])
        teams = league.teams

        teams = teams.where(sport_id: params[:filter][:sport]) if params[:filter][:sport].present?

        render json: teams
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
    else
      render action: 'new'
    end
  end

  def edit
    @team = current_admin.school.teams.find params[:id]
  end

  def update
    @team = current_admin.school.teams.find params[:id]
    if @team.update_attributes params[:team]
      redirect_to [:edit, @team]
    else
      render action: 'edit'
    end
  end

  def destroy
    @team = current_admin.school.teams.find params[:id]
    @team.destroy if @team
    redirect_to teams_path
  end
end

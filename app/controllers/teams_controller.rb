class TeamsController < ApplicationController
  before_filter :authenticate_admin!, only: [:create, :edit, :update, :destroy]

  def index
    if admin_signed_in?
      @teams = current_admin.school.teams
    end

    def league
      if params[:league_id].present?
        League.find(params[:league_id])
      else
        nil
      end
    end

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

class TeamsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    respond_to do |format|
      format.json do
        teams = nil

        if params[:league_id]
          league = League.find(params[:league_id])
          teams = league.teams.ordered
        elsif params[:assn_id]
          assn = Assn.find(params[:assn_id])
          teams = assn.teams.ordered
        end

        teams = teams.where(sport_id: params[:filter][:sport]) if params[:filter].present? &&
                                                                  params[:filter][:sport].present?

        render json: teams
      end

      format.html do
        if request.xhr?
          render partial: 'select', locals: { filter: Filter.new(params) }
          return
        end

        if admin_signed_in?
          @teams = current_school.teams
        else
          redirect_to new_admin_session_path
        end
      end
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_school.teams.build team_params
    if @team.save
      redirect_to [:edit, @team]
    else
      render action: 'new'
    end
  end

  def edit
    @team = current_school.teams.find params[:id]
  end

  def update
    @team = current_school.teams.find params[:id]
    if @team.update_attributes team_params
      redirect_to [:edit, @team]
    else
      render action: 'edit'
    end
  end

  def destroy
    @team = current_school.teams.find params[:id]
    @team.destroy if @team
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(
      :coach_email,
      :competitive_class,
      :coach_name,
      :coach_phone,
      :league_id,
      :player_ids,
      :season_id,
      :school_id,
      :sport_id,
     { :player_ids => []}
    )
  end
end

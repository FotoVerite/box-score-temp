class GameStatsController < ApplicationController
  before_filter :authenticate_admin!

  def new
    respond_to do |format|
      format.html do
        team     = teams.find(params[:team_id])
        opponent = team.potential_opponents.find(params[:opponent_id])
        game     = team.games.build(opponent_id: opponent.id)

        render partial: "games/form", locals: { game: game }
      end
    end
  end

  def teams
    @teams = current_school.teams
  end
end

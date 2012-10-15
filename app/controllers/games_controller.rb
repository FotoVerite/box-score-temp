class GamesController < ApplicationController
  before_filter :authenticate_admin!

  def index
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    respond_to do |format|
      format.html do
        @game = Game.new(date: Date.current, home_away: Game::HOME, team_id: params[:team_id])
      end
    end
  end

  def create
    team = teams.find(params[:game].delete(:team_id))
    @game = team.games.build(params[:game])

    if @game.save
      redirect_to games_path
    else
      render action: 'new'
    end
  end

  def teams
    @teams = current_admin.school.teams
  end
  helper_method :teams
end

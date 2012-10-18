class GamesController < ApplicationController
  before_filter :authenticate_admin!

  def index
  end

  def baseball
    # all three set to 'PSAL' for testing purposes
    @latest_PSAL = Game::Baseball.latest_by_assn('PSAL')
    @latest_CHSAA = Game::Baseball.latest_by_assn('PSAL')
    @latest_NYSAISAA = Game::Baseball.latest_by_assn('PSAL')

    render 'games/baseball/index'
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
      redirect_to game_path(@game)
    else
      render action: 'new'
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def teams
    @teams = current_admin.school.teams
  end
  helper_method :teams
end

class GamesController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :create, :edit, :update]

  def index
    @filter = filter
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    respond_to do |format|
      format.html do
        @game = Game.new(date: current_date, home_away: Game::HOME, team_id: params[:team_id])
      end
    end
  end

  def create
    # Make sure team_id is allowed for current_admin
    teams.find params[:game][:team_id] if params[:game][:team_id].present?
    @game = Game.new(params[:game])

    if @game.save
      GameMailer.new_stats(@game).deliver if @game.publishing?
      redirect_to game_path(@game)
    else
      render action: 'new'
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(params[:game])
      GameMailer.new_stats(@game).deliver if @game.publishing?
      redirect_to game_path(@game)
    else
      render action: 'edit'
    end
  end

  def destroy
    @game = Game.find params[:id]
    if @game
      @game.destroy
      redirect_to school_path(@game.team.school)
    else
      render action: 'edit'
    end
  end

  def teams
    @teams = current_school.teams
  end
  helper_method :teams

  def filter
    @filter ||= Filter.new((params[:filter] || {}).merge(sport_id: params[:sport_id]))
  end
  helper_method :filter

  def current_date
    if Time.now.hour < 12
      Date.yesterday
    else
      Date.current
    end
  end
end

class GamesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @games = current_admin.school.teams
  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def new
    if params[:team_id]
      @game = current_admin.school.teams.find(params[:team_id]).games.build(home_away: 'home')
      render 'new'
    else
      render 'choose_team'
    end
  end

  def edit
    if params[:team_id]
      @game = current_admin.school.teams.find(params[:team_id]).games.build(home_away: 'home')
    else
      render 'choose_team'
    end
  end

  def create
    @game = current_admin.school.teams.find(params[:team_id]).games.build(params[:game])
    if @game.update_attributes(params[:game])
      render action: 'index'
    else
      render action: 'edit'
    end
  end
end

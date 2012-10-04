class GamesController < ApplicationController
  before_filter :authenticate_admin!

  def new
    if params[:team_id]
      @game = current_admin.school.teams.find(params[:team_id]).games.build(home_away: 'home')
    else
      render 'choose_team'
    end
  end

  def create
    raise params.inspect
  end
end

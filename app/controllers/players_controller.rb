class PlayersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @players = Player.matching(params[:name])
  end

  def create
    team_ids = player_params[:team_ids]
    @player = Player.new player_params
    @player.team_ids << team_ids
    @player.save
  end

  def  remove
    @player = Player.find(params[:id])
    @player.team_ids - [params[:team_id]]
    @player.save
  end

  private

  def player_params
      params.require(:player).permit(
      :first_name,
      :last_name,
      :middle_initial,
      :school_id,
      {:team_ids => []}
    )
  end

end

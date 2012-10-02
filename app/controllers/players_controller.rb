class PlayersController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @players = Player.matching(params[:name])
  end

  def create
    @player = Player.new params[:player]
    @player.save
  end
end

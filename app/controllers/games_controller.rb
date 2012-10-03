class GamesController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @game = Game.new
  end
end

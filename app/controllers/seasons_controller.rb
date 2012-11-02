class SeasonsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    sport = Sport.find(params[:sport_id])

    respond_to do |format|
      format.json do
        render json: Season.by_sport(sport)
      end
    end
  end
end


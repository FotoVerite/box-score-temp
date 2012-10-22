class LeaguesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    assn = Assn.find(params[:assn_id])

    respond_to do |format|
      format.json do
        render json: assn.leagues
      end
    end
  end
end


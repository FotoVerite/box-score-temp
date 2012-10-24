class LeaguesController < ApplicationController
  def index
    assn = Assn.find(params[:assn_id])

    respond_to do |format|
      format.json do
        render json: assn.leagues
      end
    end
  end
end


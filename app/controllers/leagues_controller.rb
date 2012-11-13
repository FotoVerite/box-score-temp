class LeaguesController < ApplicationController
  def index
    assn = Assn.find(params[:assn_id])

    respond_to do |format|
      format.json do
        render json: assn.leagues
      end

      format.html do
        render partial: 'select', locals: { filter: Filter.new(params) }
      end
    end
  end
end


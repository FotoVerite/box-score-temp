class OpponentsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    team = current_admin.school.teams.find(params[:team_id])

    respond_to do |format|
      format.json do
        render json: team.potential_opponents
      end
    end
  end
end
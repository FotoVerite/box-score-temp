class SchoolsController < ApplicationController
  before_action :authenticate_admin!

  respond_to :html

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    authorize! :show, @school

    @unpublished_games = @school.games
    @games = @school.games.latest.published.limit(6)
  end

  def edit
    @school = School.find(params[:id])
    authorize! :edit, @school
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(school_params)
      render action: 'show'
    else
      render action: 'edit'
    end
  end

  private

  def school_params
    params.require(:school).permit(
      :address_1,
      :address_2,
      :assn_id,
      :athletic_director_email,
      :athletic_director_name,
      :athletic_director_phone,
      :mascot,
      :name,
      :short_name
    )
  end
end

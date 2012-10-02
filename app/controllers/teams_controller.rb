class TeamsController < ApplicationController
  def index
    @teams = current_admin.school.teams
  end
end

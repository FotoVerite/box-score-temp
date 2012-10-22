class HomeController < ApplicationController
  def index
    @assns = Assn.order(:name)
    @leagues = League.order(:name)
    @teams = Team.all
  end
end

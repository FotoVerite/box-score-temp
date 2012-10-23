class HomeController < ApplicationController
  def index
    @filter = Filter.new(params[:filter])
  end
end

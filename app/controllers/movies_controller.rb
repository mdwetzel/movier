class MoviesController < ApplicationController
  def index
    @in_theaters = Movie.in_theaters
  end
end

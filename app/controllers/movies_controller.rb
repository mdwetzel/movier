class MoviesController < ApplicationController
  def index
    @in_theaters = Movie.in_theaters.sort! { |a, b| a.metascore <=> b.metascore }.reverse
  end
end

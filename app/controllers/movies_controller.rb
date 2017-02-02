class MoviesController < ApplicationController

  def index
    if params[:disc_id]
      @disc = Disc.find(params[:disc_id])
      @movies = Disc.find(params[:disc_id]).movies
      @movies_all = Movie.all
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

end

class MoviesController < ApplicationController

  def index
    if params[:disc_id]
      @disc = Disc.find(params[:disc_id])
      @movies = Disc.find(params[:disc_id]).movies
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @disc = Disc.find(params[:disc_id])
    @movie = @disc.movies.build(movie_params)
    @disc.save
    if @movie.save
      redirect_to @disc, alert: "Movie Saved!"
    else
      redirect_to new_disc_movie_path(@disc), alert: "Movie Not Saved!"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(
        :title,
        :release_year,
        :imdb_url,
        :disc_id)
  end

end

class MoviesController < ApplicationController
  before_action :load_movie, only: [:show, :edit, :update]
  before_action :load_disc, only: [:create, :destroy]

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = @disc.movies.build(movie_params)
    @disc.save
    if @movie.save
      to_disc("Movie Saved!")
    else
      render :new, alert: "Movie Not Saved!"
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, alert: "Movie Updated!"
    else
      render :edit, alert: "Movie Not Updated!"
    end
  end

  def destroy
    @movie = @disc.movies.find(params[:id])
    @movie.delete
    if @disc.save
      to_disc("Movie Deleted")
    else
      to_disc("Movie Not Deleted")
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

  def load_movie
    @movie = Movie.find(params[:id])
  end

  def load_disc
    @disc = Disc.find(params[:disc_id])
  end

  def to_disc(string)
    redirect_to @disc, alert: "#{string}"
  end

end

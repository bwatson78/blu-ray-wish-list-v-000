class MoviesController < ApplicationController

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
      render :new, alert: "Movie Not Saved!"
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie, alert: "Movie Updated!"
    else
      render :edit, alert: "Movie Not Updated!"
    end
  end

  def destroy
    @disc = Disc.find(params[:disc_id])
    @movie = @disc.movies.find(params[:id])
    @movie.delete
    if @disc.save
      redirect_to @disc, alert: "Movie Deleted"
    else
      redirect_to @disc, alert: "Movie Not Deleted"
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

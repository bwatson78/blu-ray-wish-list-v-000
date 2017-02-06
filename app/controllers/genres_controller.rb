class GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      @genre = Genre.create(genre_params)
      @genre.save
      @movie.genres << @genre
      if @movie.save
        redirect_to @movie
      else
        render new_movie_genre_path(params[:movie_id])
      end
    else
      @genre = Genre.new(genre_params)
      if @genre.save
        redirect_to @genre
      else
        redirect_to new_genre_path
      end
    end
  end

  private

  def genre_params
    params.require(:genre).permit(
        :tag,
        :movie_id)
  end

end

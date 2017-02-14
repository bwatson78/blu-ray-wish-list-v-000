class GenresController < ApplicationController
  before_action :load_movie, only: [:create, :destroy]

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.find_or_create_by(genre_params)
    @genre.save
    @movie.genres << @genre
    if @movie.save
      to_movie("Tag Created!")
    else
      render new_movie_genre_path(params[:movie_id]), alert: "Tag Not Created"
    end
  end

  def destroy
    @genre = @movie.genres.find(params[:id])
    @genre.delete
    if @movie.save
      to_movie("Genre Deleted!")
    else
      to_movie("Genre Could Not Be Deleleted!")
    end
  end

  private

  def genre_params
    params.require(:genre).permit(
        :tag,
        :movie_id)
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end

  def to_movie(string)
    redirect_to @movie, alert: "#{string}"
  end

end

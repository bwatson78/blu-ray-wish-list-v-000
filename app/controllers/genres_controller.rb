class GenresController < ApplicationController

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
    @movie = Movie.find(params[:movie_id])
    @genre = Genre.find_or_create_by(genre_params)
    @genre.save
    @movie.genres << @genre
    if @movie.save
      redirect_to @movie, alert: "Tag Created!"
    else
      render new_movie_genre_path(params[:movie_id]), alert: "Tag Not Created"
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @genre = @movie.genres.find(params[:id])
    @genre.delete
    if @movie.save
      redirect_to @movie, alert: "Genre Deleted!"
    else
      redirect_to @movie, alert: "Genre Could Not Be Deleleted!"
    end
  end

  private

  def genre_params
    params.require(:genre).permit(
        :tag,
        :movie_id)
  end

end

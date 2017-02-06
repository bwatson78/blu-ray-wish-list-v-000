class ActorsController < ApplicationController

  def show
      @actor = Actor.find(params[:id])
  end

  def new
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      @actor = Actor.new
    else
      @actor = Actor.new
    end
  end

  def create
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      @actor = Actor.create(actor_params)
      @actor.save
      @movie.actors << @actor
      if @movie.save
        redirect_to @movie
      else
        render new_movie_actor_path(params[:movie_id])
      end
    else
      @actor = Actor.new(actor_params)
      if @actor.save
        redirect_to @actor
      else
        redirect_to new_actor_path
      end
    end

  end

  private

  def actor_params
    params.require(:actor).permit(
        :name,
        :imdb_url,
        :movie_id)
  end

end

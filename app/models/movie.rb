class Movie < ApplicationRecord
  belongs_to :disc, optional: true
  has_one :director
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  #def self.public_unowned_movies
  #  @movies = Movie.joins(:users).where.not(user_id: current_user.id)
  #end
end

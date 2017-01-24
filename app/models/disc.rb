class Disc < ApplicationRecord
  has_many :disc_movies
  has_many :movies, through: :disc_movies
end

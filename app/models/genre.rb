class Genre < ApplicationRecord
  belongs_to :movie, optional: true
  has_many :movie_genres
  has_many :movies, through: :movie_genres
end

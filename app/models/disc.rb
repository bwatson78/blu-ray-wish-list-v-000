class Disc < ApplicationRecord
  belongs_to :user
  has_many :disc_movies
  has_many :movies, through: :disc_movies
end

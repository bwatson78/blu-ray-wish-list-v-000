class Disc < ApplicationRecord
  belongs_to :user, optional: true
  has_many :user_discs
  has_many :users, through: :discs
  has_many :disc_movies
  has_many :movies, through: :disc_movies

  def movie_attributes
    self.try(:movie).try(:title)
  end

  def movie_attributes=(hash)
    movie = Movie.find_or_create_by(hash)
    self.movies << movie
  end

  def purchase
    self.purchased = 1
    self.save
  end


end

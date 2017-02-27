class Disc < ApplicationRecord
  # t.string   "title"
  # t.integer  "pressing_year"
  # t.boolean  "special_edition?", default: false
  # t.string   "amazon_url"
  # t.integer  "purchased"
  # t.datetime "created_at",                       null: false
  # t.datetime "updated_at",
  belongs_to :user, optional: true
  has_many :user_discs
  has_many :users, through: :discs
  has_many :disc_movies
  has_many :movies, through: :disc_movies
  validates :title, presence: true
  validates :pressing_year, inclusion: {in: 1890..Time.now.year,
    message: "Choose year between 1890 and #{Time.now.year}"}

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

  def special?
    self.special_edition? == true
  end

  def self.public_discs
    Disc.joins(:user_discs).where("user_discs.pub == 1")
  end

  def self.owned_discs
    Disc.where(purchased: 1)
  end


end

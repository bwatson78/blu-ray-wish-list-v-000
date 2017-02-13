class Movie < ApplicationRecord
    # t.string   "title"
    # t.integer  "release_year"
    # t.string   "imdb_url"
    # t.integer  "disc_id"
    # t.datetime "created_at",   null: false
    # t.datetime "updated_at",   null: false
    # t.index ["disc_id"], name: "index_movies_on_disc_id"
  belongs_to :disc, optional: true
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  validates :title, :release_year, presence: true
  validates :release_year, inclusion: {in: 1890..Time.now.year,
    message: "Choose year between 1890 and #{Time.now.year}"}

end

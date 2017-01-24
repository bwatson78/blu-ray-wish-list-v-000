# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170124200708) do

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.string   "imdb_url"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_actors_on_movie_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string   "name"
    t.string   "imdb_url"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_directors_on_movie_id"
  end

  create_table "disc_movies", force: :cascade do |t|
    t.integer  "disc_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_id"], name: "index_disc_movies_on_disc_id"
    t.index ["movie_id"], name: "index_disc_movies_on_movie_id"
  end

  create_table "discs", force: :cascade do |t|
    t.string   "title"
    t.integer  "pressing_year"
    t.boolean  "special_edition?"
    t.string   "amazon_url"
    t.boolean  "purchased?"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "tag"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_genres_on_movie_id"
  end

  create_table "movie_actors", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_movie_actors_on_actor_id"
    t.index ["movie_id"], name: "index_movie_actors_on_movie_id"
  end

  create_table "movie_genres", force: :cascade do |t|
    t.integer  "genre_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_movie_genres_on_genre_id"
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.integer  "release_year"
    t.string   "imdb_url"
    t.integer  "disc_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["disc_id"], name: "index_movies_on_disc_id"
  end

end

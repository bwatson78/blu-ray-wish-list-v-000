class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.string :imdb_url
      t.belongs_to :disc, foreign_key: true

      t.timestamps
    end
  end
end

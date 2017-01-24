class CreateDiscMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :disc_movies do |t|
      t.belongs_to :disc, foreign_key: true
      t.belongs_to :movie, foreign_key: true

      t.timestamps
    end
  end
end

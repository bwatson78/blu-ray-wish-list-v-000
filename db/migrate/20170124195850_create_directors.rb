class CreateDirectors < ActiveRecord::Migration[5.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :imdb_url
      t.belongs_to :movie, foreign_key: true

      t.timestamps
    end
  end
end

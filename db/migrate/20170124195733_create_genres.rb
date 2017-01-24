class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :tag
      t.belongs_to :movie, foreign_key: true

      t.timestamps
    end
  end
end

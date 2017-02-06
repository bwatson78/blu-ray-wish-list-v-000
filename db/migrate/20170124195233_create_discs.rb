class CreateDiscs < ActiveRecord::Migration[5.0]
  def change
    create_table :discs do |t|
      t.string :title
      t.integer :pressing_year
      t.boolean :special_edition?, default: false
      t.string :amazon_url
      t.integer :purchased

      t.timestamps
    end
  end
end

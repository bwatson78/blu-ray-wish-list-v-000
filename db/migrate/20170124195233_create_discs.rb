class CreateDiscs < ActiveRecord::Migration[5.0]
  def change
    create_table :discs do |t|
      t.string :title
      t.integer :pressing_year
      t.boolean :special_edition?
      t.string :amazon_url
      t.boolean :purchased?

      t.timestamps
    end
  end
end

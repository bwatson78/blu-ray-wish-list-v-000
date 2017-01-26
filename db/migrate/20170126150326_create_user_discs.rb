class CreateUserDiscs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_discs do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :disc, foreign_key: true
      t.boolean :public?
    end
  end
end

class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :dish
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.integer :recipe_id, null: false, foreign_key: true, index: true
      t.integer :food_id, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end

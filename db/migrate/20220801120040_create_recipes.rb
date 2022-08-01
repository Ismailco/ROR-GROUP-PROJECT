class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation_time
      t.string :cooking_time
      t.boolean :public
      t.text :description
      t.integer :user_id, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end

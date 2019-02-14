class CreateIngredientRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_recipes do |t|
      t. integer :recipe_id
      t. integer :ingredient_id
      t. integer :quantity

      t.timestamps
    end
  end
end

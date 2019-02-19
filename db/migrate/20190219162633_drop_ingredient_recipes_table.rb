class DropIngredientRecipesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :ingredient_recipes
  end
end

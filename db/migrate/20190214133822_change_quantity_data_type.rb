class ChangeQuantityDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :ingredient_recipes, :quantity, :string
  end
end

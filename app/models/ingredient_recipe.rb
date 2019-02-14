class IngredientRecipe < ApplicationRecord
  validates :quantity, presence: true
end

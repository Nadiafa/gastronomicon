class IngredientRecipesController < ApplicationController
  validates :quantity, presence: true
end

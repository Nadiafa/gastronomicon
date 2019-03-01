class RecipeIngredient < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :recipe
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient
end

class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes
end

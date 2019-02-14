class Recipe < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :user
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes
end

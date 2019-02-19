class Recipe < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end

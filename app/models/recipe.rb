class Recipe < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredient, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredient

  scope :recent, -> { order("created_at DESC").limit(3) }

    # override ingredient setter method
  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.each do |k, v|
      
      if !v[:name].empty?
        if new_k = Ingredient.find_by(name: v[:name])
          self.ingredient << new_ing
        else
          self.ingredient.build(name: v[:name])
        end 
      end
    end 
  end
end

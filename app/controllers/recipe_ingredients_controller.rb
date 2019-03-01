class RecipeIngredientsController < ApplicationController
  
  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.new(recipe_id: params[:recipe_id])
  end

  def create
    @new_ingredient_name = params[:recipe_ingredient][:ingredient_attributes][:name]  #OK => returns name
    @new_ingredient = Ingredient.find_by(name: @new_ingredient_name)  #OK => returns Ingredient object
    @recipe_id =  params[:recipe_ingredient][:recipe_id]  #OK => returns recipe_id
    @quantity = params[:recipe_ingredient][:quantity]
    if !@new_ingredient.present?
      @new_ingredient = Ingredient.create(name: @new_ingredient_name)
    end

    @new_recipe_ingredient = RecipeIngredient.new(ingredient_id: @new_ingredient.id, recipe_id: @recipe_id, quantity: @quantity)
    if @new_recipe_ingredient.save
      redirect_to recipe_path(@new_recipe_ingredient.recipe_id)
    else
      render :new 
    end
  end

  private

  # TODO
  # def recipe_ingredients_params
  #   params.require(:recipe_ingredient).permit()
  # end
end 
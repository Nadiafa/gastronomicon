class RecipeIngredientsController < ApplicationController
  
  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.new(recipe_id: params[:recipe_id])
  end

  def create
    @new_ingredient_name = params[:recipe_ingredient][:ingredient_attributes][:name]  #OK => returns name
    @ingredient = Ingredient.find_or_create_by(name: @new_ingredient_name)  #OK => returns Ingredient object 
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredients_params)  # can't get quantity for params
    if @recipe_ingredient.save
      redirect_to user_recipe_path(current_user, @recipe)
    else
      render :new 
    end 
  end

  private

  def recipe_ingredients_params
    params.require(:recipe_ingredient).permit(:recipe_id, ingredient_id: @ingredient.id, ingredient_attributes: [:quantity])
  end
end 
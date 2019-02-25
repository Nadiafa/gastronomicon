class RecipesController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @recipes = Recipe.all
  end 

  def new
    @recipe = Recipe.new
    5.times {@recipe.ingredient.build}
    @ingredients = Ingredient.all
    render :new
  end 

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new 
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def self.recent 
    where()
  end

  private 
  
  def recipe_params
    params.require(:recipe).permit(:title, :description, ingredient_attributes: [:name], ingredient_ids: [])
  end 
end

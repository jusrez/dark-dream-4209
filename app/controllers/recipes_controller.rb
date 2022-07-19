class RecipesController < ApplicationController
  def index
    @recipes = Recipe.alphabetically.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end
end
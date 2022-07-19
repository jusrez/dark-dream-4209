class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.alphabetically.all
  end
end
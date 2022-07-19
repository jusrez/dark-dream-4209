require 'rails_helper'

RSpec.describe 'Recipe Show Page' do
  describe 'As a visitor' do
    it 'will show me a list of the names of the ingredients the specified recipe has' do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      pasta = Ingredient.create!(name: "Pasta", cost: 1)
      meat = Ingredient.create!(name: "Meat", cost: 2)
      cheese = Ingredient.create!(name: "Cheese", cost: 2)
      spaghetti_ingredient1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
      spaghetti_ingredient2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meat.id)
      spaghetti_ingredient3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: cheese.id)

      visit "/recipes/#{spaghetti.id}"

      expect(page).to have_content("Pasta")
      expect(page).to have_content("Meat")
      expect(page).to have_content("Cheese")
    end

    it 'will show me the total cost of all of the ingredients in the recipe' do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      pasta = Ingredient.create!(name: "Pasta", cost: 1)
      meat = Ingredient.create!(name: "Meat", cost: 2)
      cheese = Ingredient.create!(name: "Cheese", cost: 2)
      spaghetti_ingredient1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
      spaghetti_ingredient2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meat.id)
      spaghetti_ingredient3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: cheese.id)

      visit "/recipes/#{spaghetti.id}"

      expect(page).to have_content("Total Cost")
      expect(page).to have_content(5)
  
    end
  end
end
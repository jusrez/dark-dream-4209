require 'rails_helper'

RSpec.describe 'Ingredients Index' do
  describe 'As a visitor' do
    it 'i see a list of ingredients and the number of recipes each ingredient is used in' do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      paella = Recipe.create!(name: "Paella", complexity: 3, genre: "Spanish")
      
      pasta = Ingredient.create!(name: "Pasta", cost: 1)
      meat = Ingredient.create!(name: "Meat", cost: 2)
      cheese = Ingredient.create!(name: "Cheese", cost: 2)
      shrimp = Ingredient.create!(name: "Shrimp", cost: 5)
      rice = Ingredient.create!(name: "Rice", cost: 1)

      spaghetti_ingredient1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
      spaghetti_ingredient2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meat.id)
      spaghetti_ingredient3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: cheese.id)
      paella_ingredient1 = RecipeIngredient.create!(recipe_id: paella.id, ingredient_id: shrimp.id)
      paella_ingredient2 = RecipeIngredient.create!(recipe_id: paella.id, ingredient_id: meat.id)
      paella_ingredient3 = RecipeIngredient.create!(recipe_id: paella.id, ingredient_id: rice.id)

      visit '/ingredients'

      expect(page).to have_content("Pasta")
      expect(page).to have_content("Meat")
      expect(page).to have_content("Cheese")
      expect(page).to have_content("Shrimp")
      expect(page).to have_content("Rice")
      expect(page).to have_content(1)
      expect(page).to have_content(2)
    end
  end
end
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'instance methods' do
    it 'can calculate the total cost of the ingredients in the recipe' do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      pasta = Ingredient.create!(name: "Pasta", cost: 1)
      meat = Ingredient.create!(name: "Meat", cost: 2)
      cheese = Ingredient.create!(name: "Cheese", cost: 2)
      spaghetti_ingredient1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
      spaghetti_ingredient2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meat.id)
      spaghetti_ingredient3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: cheese.id)

      expect(spaghetti.total_cost(spaghetti.ingredients)).to eq(5)
    end
  end

  describe 'class methods' do
    it 'can order recipes alphabetically' do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      bruschetta = Recipe.create!(name: "Bruschetta", complexity: 1, genre: "Italian")
      paella = Recipe.create!(name: "Paella", complexity: 3, genre: "Spanish")

      expect(Recipe.alphabetically.to_a).to eq([bruschetta, paella, spaghetti])

    end
  end
end

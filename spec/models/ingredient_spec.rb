require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'class methods' do
    it 'will sort itself alphabetically' do
      pasta = Ingredient.create!(name: "Pasta", cost: 1)
      meat = Ingredient.create!(name: "Meat", cost: 2)
      cheese = Ingredient.create!(name: "Cheese", cost: 2)
      shrimp = Ingredient.create!(name: "Shrimp", cost: 5)
      rice = Ingredient.create!(name: "Rice", cost: 1)

      expect(Ingredient.alphabetically.to_a).to eq([cheese, meat, pasta, rice, shrimp])
    end
  end

end

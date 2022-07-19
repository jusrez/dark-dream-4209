require 'rails_helper'

RSpec.describe 'Recipe Index' do
  describe 'As a visitor' do
    it 'I see a list of recipes with the following information: Name, Complexity, Genre' do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      bruschetta = Recipe.create!(name: "Bruschetta", complexity: 1, genre: "Italian")

      visit '/recipes'

      expect(page).to have_content("Spaghetti")
      expect(page).to have_content(2)
      expect(page).to have_content("Italian")
      expect(page).to have_content("Bruschetta")
      expect(page).to have_content(1)

    end
  end
end
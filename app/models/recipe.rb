class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name
  validates_presence_of :complexity
  validates_presence_of :genre

  def total_cost(ingredients)
    total_cost = 0
    ingredients.each do |ingredient|
    total_cost += ingredient.cost
    end
    return total_cost
  end

  def self.alphabetically
    order(:name)
  end
end
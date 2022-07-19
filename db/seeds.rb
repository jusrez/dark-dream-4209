# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
bruschetta = Recipe.create!(name: "Bruschetta", complexity: 1, genre: "Italian")
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
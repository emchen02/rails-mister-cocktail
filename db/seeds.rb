require 'json'
require 'open-uri'

#CLEAN THE SEED!
puts "Start of the seed"
puts "Cleaning the DB"

Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
result_serialized = open(url).read

# result is a hash of array of hashes
result = JSON.parse(result_serialized)

# types is the array of ingredients hashes
types = result['drinks']

types[0, 10].each do |type|
  ingredient = Ingredient.new(
    name: type['strIngredient1']
  )
  ingredient.save
  puts 'ingredient is created'
end

# create cocktails seed and pictures
cocktail_url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
list_serialized = open(cocktail_url).read
# result is a hash of array of hashes
list = JSON.parse(list_serialized)
# drinks array of drinks hashes
drinks = list['drinks']
# take 10 first sample
drinks[0..10].each do |drink|
  cocktail = Cocktail.new(
    name: drink['strDrink']
  )
file = URI.open(drink['strDrinkThumb'])
cocktail.photo.attach(io: file, filename: "#{cocktail.name}jpg", content_type: 'image/jpg')

  cocktail.save
  puts 'cocktail is created'
end

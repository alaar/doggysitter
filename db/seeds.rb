# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'json'
# require 'open-uri'

Offer.destroy_all
User.destroy_all

# url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# user_serialized = open(url).read
# cocktails = JSON.parse(user_serialized)

# cocktails['drinks'].each do |cocktail|
#   Ingredient.create(name: cocktail['strIngredient1'])
# end

emails = ["wangwang@gmail.com", "wolf@gmail.com", "bark@gmail.com"]
emails.each do |email|
  User.create!(email: email, password: "123456")
end

users_array = User.all


offers = [
  {
    # photo: "images/alvin-balemesa-105751-unsplash.jpg",
    user: users_array.sample,
    location: "Montreal",
    price: 20,
    date_time: "20180302"
    },
  {
    # photo: "images/autri-taheri-521018-unsplash.jpg",
    user: users_array.sample,
    location: "Quebec",
    price: 15,
    date_time: "20180303"
    },
  {
    # photo: "images/isi-akahome-315125-unsplash.jpg",
    user: users_array.sample,
    location: "Laval",
    price: 30,
    date_time: "20180301"

    },
  {
    # photo: "images/jordan-koons-396362-unsplash.jpg",
    user: users_array.sample,
    location: "Montreal",
    price: 25,
    date_time: "20180309"
    },
  {
    # photo: "images/kevin-quezada-558350-unsplash.jpg",
    user: users_array.sample,
    location: "Montreal",
    price: 15,
    date_time: "20180310"
    },
  {
    # photo: "images/marvin-meyer-188676-unsplash.jpg",
    user: users_array.sample,
    location: "Montreal",
    price: 18,
    date_time: "20180303"

    }
]

offers.each do |offer|
  Offer.create!(offer)
end




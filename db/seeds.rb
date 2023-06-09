# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

# puts "cleaning the database"

# Movie.destroy_all

puts "creating movies"

url = "https://tmdb.lewagon.com/movie/popular"
movies_result = URI.open(url).read
movies_json = JSON.parse(movies_result)
movies = movies_json["results"]

movies.each do |movie|
  movie = Movie.create(title: "#{movie["original_title"]}", overview: "#{movie["overview"]}", rating: "#{movie["vote_average"]}", poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}")
  puts "Movie with #{movie.id} id was created"
end

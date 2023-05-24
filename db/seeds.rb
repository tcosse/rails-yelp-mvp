# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
rand(5..10).times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address,
    category: %w[chinese italian japanese french belgian].sample
  )
end

Restaurant.all.each do |restaurant|
  Review.create(
    rating: (0..5).to_a.sample,
    content: Faker::Emotion.noun,
    restaurant: restaurant
  )
end

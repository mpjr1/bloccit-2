# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# # Create Posts
# 50.times do
#   Post.create!(
#     title: Faker::Lorem.sentence,
#     body:  Faker::Lorem.paragraph
#     )
# end
# posts = Post.all

# # Create Comments
# 100.times do
#   Comment.create!(
#     post: posts.sample,
#     body: Faker::Lorem.paragraph
#     )
# end

# Create Advertisements
50.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Number.number(2)
    )
end

puts "Seed finished"
#puts "#{Post.count} posts created"
#puts "#{Comment.count} comment created"
puts "#{Advertisement.count} Advertisements created"
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

#Verify the Post doesn't exist  in the data base yet.
if Post.where(title: "Unique First Post").blank? 
# Create Unique Post
Post.create!(
  title: "Unique First Post",
  body: "Unique First Body Text")
end

#Verify Second Post doesn't exist  in the data base yet.
if Post.where(title: "Unique Second Post").blank? 
# Create Unique Post
Post.create!(
  title: "Unique Second Post",
  body: "Unique Second Body Text")
end


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comment created"
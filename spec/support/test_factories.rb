require 'spec_helper'
require 'factory_girl_rails'
require 'factory_girl'

module TestFactories
  

  
  def associated_post(options={})
  
   post_options = {
     title: 'Post title',
     body: 'Post bodies must be pretty long.',
     topic: Topic.create(name: 'Topic name'),
     user: authenticated_user
     }.merge(options)
   
    Post.create(post_options)
  end

 def authenticated_user(options={})

   user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
   user = User.new(user_options)
   user.skip_confirmation!
   user.save
   user
 end

  ::FactoryGirl.define do
    factory :user do
      name 'Test User'
      email 'test0@example.com'
      password 'helloworld'
      #if needed
      #is_active true
    end
  end
   ::FactoryGirl.define do
    factory :post do
      title "Post Title"
      body "Post bodies must be pretty long."
      user '@user'
      topic { Topic.create(name: 'Topic name') }
    end
   end

    ::FactoryGirl.define do
      factory :comment do
      body "This is a new comment."
        user '@user'
      post

      after(:build) do |comment|
        comment.class.skip_callback(:create, :after, :send_favorite_emails)
    end
  end
end
 
end
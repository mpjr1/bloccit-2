require 'rails_helper'
require 'spec_helper'
require 'warden'


 describe "Visiting profiles" do
   
   include Warden::Test::Helpers
   Warden.test_mode!
 
   include TestFactories
 
   before do
     @user = authenticated_user
     @post = associated_post(user: @user)
     @comment = Comment.new(user: @user, post: @post, body: "A Comment")
     allow(@comment).to receive(:send_favorite_emails)
     @comment.save!
   end
 
   describe "not signed in" do
 
     it "shows profile" do
       visit user_path(@user)
       expect(current_path).to eq(user_path(@user))
       
       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
     end     
   end
      
   describe "signed in" do 
    before do
      user = User.create(email: 'test01@example.com', password: 'helloworld')
      user.confirm!
      login_as user, scope: :user
    end 
     
     after do
       Warden.test_reset! 
     end

    it "shows profile" do 
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end    
    

  end 
end
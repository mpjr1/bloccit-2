require 'rails_helper'

include TestFactories

RSpec.describe Vote, type: :model do
 describe "validations" do
   
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        first_test_value = Vote.new(value: 1)
        expect(first_test_value.valid?).to eq(true)
        
        second_test_value = Vote.new(value: -1)
        expect(second_test_value.valid?).to eq(true)
        
        third_test_value = Vote.new(value: 2)
        expect(third_test_value.valid?).to eq(false)
        
        fourth_test_value = Vote.new(value: -3)
        expect(fourth_test_value.valid?).to eq(false)
      end
    end
  end
  
  describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end
end
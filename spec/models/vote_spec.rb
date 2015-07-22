require 'rails_helper'


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
end
require 'rails_helper'

RSpec.describe User, type: :model do

  user = User.new(
    first_name: "Albus",
    last_name: "Dumbledore",
    email: "albus@wizard.com",
    password: 'wizard',
    password_confirmation: 'wizard'
  )

  describe 'User Validations' do
    it "should save a new user with valid attributes" do 
      expect(user).to (be_valid)
    end
    it "is not valid without a first name" do 
      user.first_name = nil;
      expect(user).to_not (be_valid)
    end
    it "is not valid without a last name" do 
      user.last_name = nil;
      expect(user).to_not (be_valid)
    end
    it "is not valid without an email" do 
      user.email = nil;
      expect(user).to_not (be_valid)
    end
  end
end

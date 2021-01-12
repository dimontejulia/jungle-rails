require 'rails_helper'

RSpec.describe User, type: :model do

  user = User.new(
    first_name: "Albus",
    last_name: "Dumbledore",
    email: "albus@wizard.com",
    password: 'wizard',
    password_confirmation: 'wizard'
  )

  describe 'New User Validations:' do
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
    it "is not valid with emails already in db even if case is different" do
      user = User.new(
        first_name: "Albus",
        last_name: "Dumbledore",
        email: "albus@wizard.com",
        password: 'wizard',
        password_confirmation: 'wizard'
      )
      user.save
      user2 = User.new(
        first_name: "Albus",
        last_name: "Dumbledore",
        email: "AlbuS@WiZARd.COM",
        password: 'wizard',
        password_confirmation: 'wizard'
      )
      expect(user2).to_not (be_valid)
    end
    it "is not valid with passwords less than 8 characters" do 
      user.password = '123';
      user.password_confirmation = '123';
      expect(user).to_not (be_valid)
    end
  end
end

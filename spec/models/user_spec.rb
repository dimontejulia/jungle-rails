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

  describe ".authenticate_with_credentials" do
    user = User.new(
      first_name: "Severus",
      last_name: "Snape",
      email: "snape@wizard.com",
      password: 'wizard',
      password_confirmation: 'wizard'
    )
    user.save
    it "returns an instance of the user with valid credentials" do
      user = User.authenticate_with_credentials('snape@wizard.com', 'wizard')
      expect(user).not_to be (nil)
    end
    it "returns nil of the user with an invalid email" do
      user = User.authenticate_with_credentials('severus@wizard.com', 'wizard')
      expect(user).to be (nil)
    end
    it "returns nil of the user with an invalid password" do
      user = User.authenticate_with_credentials('snape@wizard.com', 'muggle')
      expect(user).to be (nil)
    end
  end
end

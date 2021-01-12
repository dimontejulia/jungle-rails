require 'rails_helper'

RSpec.describe User, type: :model do

  user = User.new(
    first_name: "Remus",
    last_name: "Lupin",
    email: "remus@wizard.com",
    password: 'wizard',
    password_confirmation: 'wizard'
  )
  user.save
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
      user = User.new
      user.first_name = 'Dolores'
      user.last_name = 'Umbridge'
      user.email = 'dolores@wizard.com'
      user.password = 'wizard'
      user.password_confirmation = 'wizard'

      user.save
      
      user2 = User.new
      user2.first_name = 'Dolores'
      user2.last_name = 'Umbridge'
      user2.email = 'dolores@WIZARD.com'
      user2.password = 'wizard'
      user2.password_confirmation = 'wizard'
      user2.save
    
      expect(user2.errors[:email].first).to eq('has already been taken')
    end
    it "is not valid with passwords less than 6 characters" do 
      user.password = '123';
      user.password_confirmation = '123';
      expect(user).to_not (be_valid)
    end
  end

  describe ".authenticate_with_credentials" do

    it "returns an instance of the user with valid credentials" do
      
      user = User.new(
        first_name: "Minerva",
        last_name: "McGonagall",
        email: "minerva@wizard.com",
        password: 'wizard',
        password_confirmation: 'wizard'
      )
      user.save
      loginUser = User.authenticate_with_credentials('minerva@wizard.com', 'wizard')
      expect(loginUser).not_to be (nil)
    end
    it "returns nil of the user with an invalid email" do
      user = User.new(
        first_name: "Minerva",
        last_name: "McGonagall",
        email: "minerva@wizard.com",
        password: 'wizard',
        password_confirmation: 'wizard'
      )
      user.save
      user = User.authenticate_with_credentials('minerva123@wizard.com', 'wizard')
      expect(user).to be (nil)
    end
    it "returns nil of the user with an invalid password" do
      user = User.new(
        first_name: "Minerva",
        last_name: "McGonagall",
        email: "minerva@wizard.com",
        password: 'wizard',
        password_confirmation: 'wizard'
      )
      user.save
      user = User.authenticate_with_credentials('minerva@wizard.com', 'muggle')
      expect(user).to be (nil)
    end
    it "returns an instance of the user with an email with whitespace" do
      user = User.new(
        first_name: "Minerva",
        last_name: "McGonagall",
        email: "minerva@wizard.com",
        password: 'wizard',
        password_confirmation: 'wizard'
      )
      user.save
      user = User.authenticate_with_credentials('     minerva@wizard.com', 'wizard')
      expect(user).to_not be (nil)
    end
  end
  
end

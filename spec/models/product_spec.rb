require 'rails_helper'

RSpec.describe Product, type: :model do

  

  describe 'Validations' do
    it "should save a product with valid attributes" do 
      @category = Category.create(name:"Magic")
      product = Product.new(
        name: "Magic Wand",
        price: 66.00,
        quantity: 21,
        category_id: @category.id
        )
      expect(product).to (be_valid)
    end
    it "is not valid without a name" do 
      @category = Category.create(name:"Magic")
      product = Product.new(
        name: nil,
        price: 66.00,
        quantity: 21,
        category_id: @category.id
      )
      expect(product).to_not (be_valid)
      expect(product.errors.full_messages).to include ("Name can't be blank")
    end
    it "is not valid without a price" do
      @category = Category.create(name:"Magic")
      product = Product.new(
        name: "Cloak",
        price: nil,
        quantity: 20,
        category_id: @category.id
        )
      expect(product).to_not (be_valid)
      expect(product.errors.full_messages).to include ("Price must be other than 0")

    end
    it "is not valid without a quantity" do
      @category = Category.create(name:"Magic")
      product = Product.new(
        name: "Broomstick",
        price: "355.00",
        quantity: nil,
        category_id: @category.id
        )
      expect(product).to_not (be_valid)
      expect(product.errors.full_messages).to include ("Quantity can't be blank")
    end
    it "is not valid without a category" do
      @category = Category.create(name:"Magic")
      product = Product.new(
        name: "Potion vials",
        price: 120.99,
        quantity: 120,
        category_id: nil
        )
      expect(product).to_not (be_valid)
      expect(product.errors.full_messages).to include ("Category can't be blank")

  end

  end
end

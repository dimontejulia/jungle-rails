require 'rails_helper'

RSpec.describe Product, type: :model do

  @category = Category.create(name:"Magic")
  product = Product.new(
    name: "Magic Wand",
    price: 66.00,
    quantity: 21,
    category_id: @category.id
    )

  describe 'Validations' do
    it "should save a product with valid attributes" do 
      expect(product).to (be_valid)
    end

    it "is not valid without a name" do 
      product.name = nil;
      expect(product).to_not (be_valid)
      expect(product.errors.full_messages).to include ("Name can't be blank")
    end

    it "is not valid without a price" do
      product.price = nil;
      expect(product).to_not (be_valid)
      expect(product.errors.full_messages).to include ("Price must be other than 0")

    end
    it "is not valid without a quantity" do
      product.quantity = nil;
      expect(product).to_not (be_valid)
      expect(product.errors.full_messages).to include ("Quantity can't be blank")
    end
    it "is not valid without a category" do
      product.category_id = nil;
      expect(product).to_not (be_valid)
      expect(product.errors.full_messages).to include ("Category can't be blank")

  end

  end
end

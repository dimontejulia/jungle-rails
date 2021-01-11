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
  end

    # it "is not valid without a description"
    # it "is not valid without a start_date"
    # it "is not valid without a end_date"
  end
end

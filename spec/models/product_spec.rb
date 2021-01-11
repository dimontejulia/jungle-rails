require 'rails_helper'

RSpec.describe Product, type: :model do

  

  describe 'Validations' do
    it "should save a product with valid attributes" do 
      @category = Category.create(name:"Magic")
      product = Product.new(
        name: "Magic Want",
        price: 66.00,
        quantity: 21,
        category_id: @category.id
        )
      expect(product).to (be_valid)
    end
    
  end
end

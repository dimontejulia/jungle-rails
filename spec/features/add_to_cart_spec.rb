require 'rails_helper'
require 'faker'

RSpec.feature "Visitor navigates to a product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do

    # ACT
    visit root_path
    save_screenshot('home_page_test3.png')
    first('a.btn-primary').click
    

  end
end
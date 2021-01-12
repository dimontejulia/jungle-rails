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

    user = User.create!(
      first_name: "Minerva",
      last_name: "McGonagall",
      email: "minerva@wizard.com",
      password: 'wizard',
      password_confirmation: 'wizard'
    )
  end

  scenario "They see all products" do

    # ACT
    visit root_path
    click_on 'Login'
    expect(page).to have_content('Password')
    save_screenshot('login_page.png')
    
    fill_in 'email', with: 'minerva@wizard.com'
    fill_in 'password', with: 'wizard'

    save_screenshot('login_page_with_credentials.png')

    click_on 'Submit'
    expect(page).to have_content('Signed in as')

    save_screenshot('home_page_post_login.png')
  end
end
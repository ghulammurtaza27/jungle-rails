require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "Adds to Cart" do
    visit root_path

    # commented out b/c it's for debugging only
    # save_and_open_screenshot
    first('.product').click_button('Add')

    expect(page).to have_content('My Cart (1)')
    save_screenshot 'test_3_cart_details.png'
  end
end

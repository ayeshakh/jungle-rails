require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true  do
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


  scenario "They see product details" do
    # ACT
    visit root_path
    page.first('article.product h4').click

    sleep 1 # this is done because page loading is taking long and screen shot is being taken before page loads
    # DEBUG
    save_screenshot('product_details.png')


     # VERIFY
    expect(page).to have_css 'article.product-detail', count: 1
  end
end

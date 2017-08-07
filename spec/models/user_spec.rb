require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "is a valid test" do
      @category = Category.new
      product = Product.new ({
        name: "wooden-bench",
        price: 50,
        quantity: 5,
        category: @category
        })
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = Product.new(name: nil)
      product.valid?
      # puts product.errors.full_messages.inspect
      # (can use this to see what the errors actually are!!)
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "is invalid without a price" do
      product = Product.new(price: nil)
      product.valid?
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "is invalid without a quantity" do
      product = Product.new(quantity: nil)
      product.valid?
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is invalid without a category" do
      product = Product.new(category_id: nil)
      product.valid?
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

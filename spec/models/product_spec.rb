require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      before do
        @cat1 = Category.find_or_create_by! name: 'Stationery'
        @product = Product.new(
          name: "Red NoteBook",
          price: 20,
          quantity: 5,
          description: "It is a hardback notebook",
          category: @cat1
        )
      end
      it "example where it creates a product" do
        expect(@product.errors.full_messages).to eq([])
        puts @product.valid?
      end
      it "should have a name" do
        @product.name = nil
        puts @product.valid?
        puts @product.errors.full_messages
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "should have a quantity" do
        @product.quantity = nil
        puts @product.valid?
        puts @product.errors.full_messages
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
      it "should have a price" do
        @product.price = ""
        puts @product.valid?
        puts @product.errors.full_messages
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it "should have a category" do
        @product.category = nil
        puts @product.valid?
        puts @product.errors.full_messages
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
  end
end


# before do
#   @book = Book.new(:name => "RSpec Intro", :price => 20)
#   @order.submit
# end
require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:product) { Product.create!(name: "Test Product", price: 5.0) }
  let(:cart)    { Cart.create!(total_price: 0) }

  describe "validations" do
    it "is valid with positive quantity" do
      cart_item = CartItem.new(cart: cart, product: product, quantity: 2)
      expect(cart_item).to be_valid
    end

    it "is invalid with zero quantity" do
      cart_item = CartItem.new(cart: cart, product: product, quantity: 0)
      expect(cart_item).not_to be_valid
    end

    it "is invalid with negative quantity" do
      cart_item = CartItem.new(cart: cart, product: product, quantity: -1)
      expect(cart_item).not_to be_valid
    end
  end

  describe "price calculations" do
    it "returns the correct unit_price" do
      item = CartItem.new(cart: cart, product: product, quantity: 1)
      expect(item.unit_price).to eq(5.0)
    end

    it "returns the correct total_price" do
      item = CartItem.new(cart: cart, product: product, quantity: 3)
      expect(item.total_price).to eq(15.0)
    end
  end

  describe "increase_quantity" do
    it "increases the quantity by the given amount" do
      item = CartItem.create!(cart: cart, product: product, quantity: 2)
      expect {
        item.increase_quantity(3)
      }.to change { item.reload.quantity }.from(2).to(5)
    end
  end
end

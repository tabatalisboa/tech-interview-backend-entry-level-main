class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }

  def unit_price
    product.price
  end

  def total_price
    unit_price * quantity
  end
end

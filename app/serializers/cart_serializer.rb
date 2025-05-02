class CartSerializer < ActiveModel::Serializer
  attributes :id, :products, :total_price

  def products
    object.cart_items.includes(:product).map do |item|
      price = item.product.price
      {
        id: item.product.id,
        quantity: item.quantity,
        unit_price: price,
        total_price: (price * item.quantity).round(2)
      }
    end
  end

  def total_price
    products.sum { |p| p[:total_price] }.round(2)
  end
end

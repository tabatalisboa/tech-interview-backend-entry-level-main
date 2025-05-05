class CartSerializer < ActiveModel::Serializer
  attributes :id, :products, :total_price

  def products
    object.cart_items.map do |item|
      {
        id: item.product.id,
        name: item.product.name,
        quantity: item.quantity,
        unit_price: item.unit_price,
        total_price: item.total_price
      }
    end
  end

  def total_price
    object.total_price
  end
end

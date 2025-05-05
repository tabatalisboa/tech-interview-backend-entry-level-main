class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :quantity, :unit_price, :total_price
  
  def unit_price
    object.unit_price
  end

  def total_price
    object.total_price
  end
end
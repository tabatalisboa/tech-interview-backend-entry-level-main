class CartsController < ApplicationController
#   before_action :set_cart

#   ## TODO Escreva a lógica dos carrinhos aqui
#   def create_cart
#   end

#   def add_item(product_id, quantity)
#     # cart = Session.cart
#     if not cart
#       cart = self.create_cart()
#     end
#     item = CartItem.new(@cart.id, product_id, quantity)
#   end

#   def remove_item(product_id)
#     cart = Session.cart
#     if product_id
#       if product_id in cart.products
#   end

#   # /cart
#   def create 
#     @product = Product.new(product_params)

#     if @product.save
#       render json: @product, status: :created, location: @product
#     else
#       render json: @product.errors, status: :unprocessable_entity
#     end
#   end

#   private

#   def set_cart
#     @cart = Session.cart
#   end
# end
# 
  def show
    cart = Cart.find_or_create_by(session_id: session.id.to_s)
    render json: cart
  end

  def create
    
  end

  def add_item
    product = Product.find_by(id: params[:product_id])
    return render json: { error: 'Product not found' }, status: :not_found unless product

    cart = Cart.find_or_create_by(session_id: session.id.to_s)

    cart_item = cart.cart_items.find_or_initialize_by(product_id: product.id, cart_id: cart.id)
    cart_item.quantity += params[:quantity].to_i
    cart_item.save!

    render json: cart
  end

  def remove_item
    cart = Cart.find_by(session_id: session.id.to_s)
    return head :no_content unless cart

    cart_item = cart.cart_items.find_by(product_id: params[:product_id])
    cart_item&.destroy

    render json: cart
  end
end
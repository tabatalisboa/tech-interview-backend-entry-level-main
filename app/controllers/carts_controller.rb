class CartsController < ApplicationController
  before_action :set_cart

  ## TODO Escreva a lógica dos carrinhos aqui
  def create_cart
  end

  def add_item(product_id, quantity)
    # cart = Session.cart
    if not cart
      cart = self.create_cart()
    end
    item = CartItem.new(@cart.id, product_id, quantity)
  end

  def remove_item(product_id)
    cart = Session.cart
    if product_id
      if product_id in cart.products
  end

  # /cart
  def create 
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private

  def set_cart
    @cart = Session.cart
  end
end

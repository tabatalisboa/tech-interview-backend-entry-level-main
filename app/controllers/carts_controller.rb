class CartsController < ApplicationController
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_by(product: product)

    if cart_item
      cart_item.update(quantity: cart_item.quantity + params[:quantity].to_i)
    else
      @cart.cart_items.create(product: product, quantity: params[:quantity])
    end

    render json: @cart, serializer: CartSerializer
  end

  def show
    render json: @cart, serializer: CartSerializer
  end

  def add_item
    product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_by(product: product)

    if cart_item
      cart_item.update(quantity: params[:quantity])
    else
      @cart.cart_items.create(product: product, quantity: params[:quantity])
    end

    render json: @cart, serializer: CartSerializer
  end

  def remove_item
    cart_item = @cart.cart_items.find_by(product_id: params[:product_id])

    if cart_item
      cart_item.destroy
      render json: @cart, serializer: CartSerializer
    else
      render json: { error: 'Produto não encontrado no carrinho.' }, status: :not_found
    end
  end

  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id])

    unless @cart
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end

class CartsController < ApplicationController
  before_action :set_cart

  # POST /cart
  def create
    product = Product.find_by(id: params[:product_id])
    return render json: { error: 'Produto não encontrado' }, status: :not_found unless product

    cart_item = @cart.cart_items.find_by(product_id: product.id)
    if cart_item
      cart_item.quantity += params[:quantity].to_i
    else
      cart_item = @cart.cart_items.build(product: product, quantity: params[:quantity])
    end
    cart_item.save

    render json: @cart, status: :ok
  end

  # GET /cart
  def show
    render json: @cart, status: :ok
  end

  # POST /cart/add_item
  def add_item
    product = Product.find_by(id: params[:product_id])
    return render json: { error: 'Produto não encontrado' }, status: :not_found unless product

    cart_item = @cart.cart_items.find_by(product_id: product.id)
    if cart_item
      cart_item.increment!(:quantity, params[:quantity].to_i)
    else
      @cart.cart_items.create!(product: product, quantity: params[:quantity])
    end

    render json: @cart, status: :ok
  end

  # DELETE /cart/:product_id
  def destroy
    cart_item = @cart.cart_items.find_by(product_id: params[:product_id])
    return render json: { error: 'Produto não encontrado no carrinho' }, status: :not_found unless cart_item

    cart_item.destroy
    render json: @cart, status: :ok
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

class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!

  def index
     @cart_items = current_customer.cart_items
     @total = 0
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    sum = cart_item.quantity + params[:cart_item][:quantity].to_i
    cart_item.update(quantity: sum)
    else
    cart_item = CartItem.new(params_cart_item)
    cart_item.save
    end
    redirect_to public_cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
    redirect_to public_cart_items_path
    end
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(params_cart_item)
    redirect_to public_cart_items_path
  end

  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
  end

end
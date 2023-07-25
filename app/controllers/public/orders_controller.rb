class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = current_customer.orders.new
  end

  def create
   @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save

        current_customer.cart_items.each do |cart_item|
          @order_detail = OrderDetail.new
          @order_detail.item_id = cart_item.item_id
          @order_detail.quantity = cart_item.quantity
          @order_detail.price = (cart_item.item.price*1.1).floor
          @order_detail.order_id =  @order.id
          @order_detail.save
        end

        current_customer.cart_items.destroy_all #カートの中身を削除
        redirect_to complete_orders_path
  end



  def confirm
    @orders = current_customer.orders
    @order = Order.new(order_params)

  if params[:order][:select_address] == "0"
    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.name = current_customer.family_name + current_customer.first_name

  elsif params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.post_code = @address.post_code
    @order.address = @address.address
    @order.name = @address.name

  else

    @order.post_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]

  end
     @total = 0
     @cart_items = current_customer.cart_items.all
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @toral = 0

  end

private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :postage, :total_price, :payment_method, :orders_status)
  end

end
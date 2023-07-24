class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = current_customer.orders.new
  end

  def create
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items = current_customer.cart_items
      cart_items.each do |c_item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = c_item.item_id
        order_detail.quantity = c_item.quantity
        order_detail.price = c_item.item.price
        order_detail.production_status = 0
        order_detail.save
      end
      cart_items.destroy_all
      redirect_to complete_path
    else
      render :new
    end
  end


  def confirm
    @orders = current_customer.orders
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:addresses_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.shipname
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

  def complete
  end


private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :postage, :total_price, :payment_method, :orders_status)
  end

end
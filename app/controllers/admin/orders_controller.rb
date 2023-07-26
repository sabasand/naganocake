class Admin::OrdersController < ApplicationController
  def index
    @order = Order.page(params[:page])
    customer_id = Customer.find_by(id: @order.ids)
    #@full_name = customer_id.family_name + "" + customer_id.first_name
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end
end
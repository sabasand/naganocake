class Admin::OrdersController < ApplicationController
  def index
    @order = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end
end
class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @full_name = @order.customer.family_name + "" + @order.customer.first_name
  end

   def update
  @order = Order.find(params[:id])
  if @order.update(order_params)
     @order.order_details.update_all(production_status: 1) if @order.orders_status == "入金確認"
  end
  redirect_to admin_order_path
   end


private
  def order_params
  params.require(:order).permit(:orders_status)
  end

end
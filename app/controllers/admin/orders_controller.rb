class Admin::OrdersController < ApplicationController
  def index
    @order = Order.page(params[:page])
    customer_id = Customer.find_by(id: @order.ids)
    @full_name = customer_id.family_name + "" + customer_id.first_name
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
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
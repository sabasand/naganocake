class Admin::OrderDetailsController < ApplicationController
 before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_detail.all
    is_updated = true

    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.production_status == "in_production"

      @order_items.each do |order_item|
        if order_detail.production_status != "production_complete"
          is_updated = false
        end
      end

      @order.update(status: 3) if is_updated
      redirect_to admin_order_path(@order)
    else
      render 'Orders#show'
    end
  end

  private

  def order_detail_params
    params.require(:order_item).permit(:production_status)
  end
end

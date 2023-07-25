class Admin::OrderDetailsController < ApplicationController
 before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id]) # 注文詳細を取得
    @order = @order_detail.order # 注文を取得
    @order_details = @order.order_details.all
    is_updated = true

    if @order_detail.update(order_detail_params)
      @order.update(production_status: 2) if @order_detail.production_status == "in_production"

      @order_details.each do |order_detail|
        if order_detail.production_status != "production_complete"
          is_updated = false
        end
      end

      @order.update(production_status: 3) if is_updated
      redirect_to admin_order_path(@order)
    else
      render 'Orders#show'
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end

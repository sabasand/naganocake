class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address2_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to action: :index
    else
      flash[:alert] = "登録できませんでした。"
      redirect_to action: :index
    end
  end

  def update
    address = Address.find(params[:id])
    if address.update(address1_params)
      redirect_to action: :index
    else
      flash[:alert] = "更新できませんでした。"
      redirect_to action: :index
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      redirect_to action: :index
    else
      flash[:alert] = "削除できませんでした。"
      redirect_to action: :index
    end
  end

private
  def address1_params
    params.require(:address).permit(:customer_id, :post_code, :address, :shipname,:commit,:id)
  end
  def address2_params
    params.permit(:customer_id, :post_code, :address, :shipname)
  end
end
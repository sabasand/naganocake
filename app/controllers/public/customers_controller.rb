class Public::CustomersController < ApplicationController
  def show
   @customer = current_customer
  end

  def edit
  end


  def update
    if current_customer.update(customer_params)
      redirect_to  mypage_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:email, :family_name, :first_name, :family_name_kana, :first_name_kana, :encrypted_password, :post_code, :address, :phonenumber, :is_deleted)
  end

end
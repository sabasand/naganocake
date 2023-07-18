class CartItem < ApplicationRecord

 belongs_to :item
 belongs_to :customer

  def subtotal
    item.price * quantity
  end

end

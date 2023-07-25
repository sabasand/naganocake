class CartItem < ApplicationRecord
 belongs_to :item
 belongs_to :customer
 validates :quantity, presence: true

  def subtotal
    (item.price * 1.1).round * quantity
  end

end

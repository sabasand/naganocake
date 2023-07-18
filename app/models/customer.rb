class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :orders, dependent: :destroy
 has_many :cart_items, dependent: :destroy
 has_many :addresses, dependent: :destroy

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_name_kana, presence: true
  validates :family_name_kana, presence: true
  validates :post_code, presence: true, length: {maximum: 7, minimum: 7}
  validates :address, presence: true
  validates :phonenumber, presence: true, length: {maximum: 11, minimum: 10}


 def name
    family_name + first_name
 end

end

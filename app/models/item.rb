class Item < ApplicationRecord
  # items_imegeという名前でActiveStorageでプロフィール画像を保存できるように設定
  has_one_attached :item_image
end

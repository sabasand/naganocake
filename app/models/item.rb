class Item < ApplicationRecord
  # megeという名前でActiveStorageで商品画像を保存できるように設定
  has_one_attached :image

  # itemとgenreを結びつける設定
  belongs_to :genre  # ジャンルに属する

  #商品画像設定
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # メソッドに対して引数を設定し、引数に設定した値に画像のサイズを変換するように設定
    image.variant(resize_to_fit: [width, height]).processed
  end
end

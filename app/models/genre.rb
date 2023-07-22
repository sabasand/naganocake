class Genre < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # itemとgenreを結びつける設定
  # # dependent: :destroyは、has_manyで使えるオプションです。 1:Nの関係において、
  # 「1」のデータが削除された場合、関連する「N」のデータも削除される設定
  has_many :item, dependent: :destroy
end

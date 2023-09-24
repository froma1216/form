class Like < ApplicationRecord
  # 空白✕
  validates :user_id, { presence: true }
  # 空白✕
  validates :post_id, { presence: true }
end

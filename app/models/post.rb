class Post < ApplicationRecord
  # 空✕、140字以内
  validates :content, { presence: true, length: { maximum: 140 } }
  # 空✕
  validates :user_id, { presence: true }
  # 投稿に紐づくユーザ情報を返す
  def user
    User.find_by(id: user_id)
  end
end

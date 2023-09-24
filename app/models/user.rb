class User < ApplicationRecord
  # パスワードをハッシュ化
  # 下記のバリデーションを網羅しているため、記載不要。
  # validates :password, { presence: true }
  has_secure_password

  # 空✕
  validates :name, { presence: true }
  # 空✕、重複✕
  validates :email, { presence: true, uniqueness: true }

  # ユーザに紐づく投稿をすべて返す
  def posts
    Post.where(user_id: id)
  end
end

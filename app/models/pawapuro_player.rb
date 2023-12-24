class PawapuroPlayer < ApplicationRecord
  # アソシエーション
  # belongs_to :{テーブル名}, foreign_key: '{keyカラム}', class_name: '{モデル名}', optional: true
  belongs_to :pawapuro_fielder, foreign_key: "fielder_id", class_name: "PawapuroFielder", optional: true
end

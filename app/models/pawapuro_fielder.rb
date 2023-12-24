class PawapuroFielder < ApplicationRecord
  has_one :pawapuro_player, foreign_key: "fielder_id", class_name: "PawapuroPlayer"
end

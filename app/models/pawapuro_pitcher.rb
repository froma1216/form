class PawapuroPitcher < ApplicationRecord
  has_one :pawapuro_pitcher, foreign_key: "pitcher_id", class_name: "PawapuroPlayer"
end

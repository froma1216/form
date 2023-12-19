class AddKaifukuKegasinikusaOtherSpecialAbilitiesToPawapuroPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :pawapuro_players, :kaifuku, :integer
    add_column :pawapuro_players, :kegasinikusa, :integer
    add_column :pawapuro_players, :other_special_abilities, :string
  end
end

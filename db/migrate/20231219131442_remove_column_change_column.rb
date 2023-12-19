class RemoveColumnChangeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :pawapuro_players, :created_by, :string
    change_column :pawapuro_players, :updated_by, :string
    change_column :pawapuro_pitchers, :created_by, :string
    change_column :pawapuro_pitchers, :updated_by, :string
    change_column :pawapuro_pitchers, :other_special_abilities, :string
    remove_column :pawapuro_pitchers, :kegasinikusa
    remove_column :pawapuro_pitchers, :kaifuku
    change_column :pawapuro_fielders, :created_by, :string
    change_column :pawapuro_fielders, :updated_by, :string
  end
end

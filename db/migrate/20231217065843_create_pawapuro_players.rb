class CreatePawapuroPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :pawapuro_players do |t|
      t.string :last_name
      t.string :first_name
      t.string :back_name
      t.date :birthday
      t.integer :main_position
      t.integer :sub_position_2
      t.integer :sub_position_3
      t.integer :sub_position_4
      t.integer :sub_position_5
      t.integer :sub_position_6
      t.integer :sub_position_7
      t.string :throws
      t.string :bats
      t.text :note
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end

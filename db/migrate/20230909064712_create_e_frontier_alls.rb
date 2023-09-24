class CreateEFrontierAlls < ActiveRecord::Migration[7.0]
  def change
    create_table :e_frontier_alls do |t|
      t.integer :no
      t.string :name
      t.string :type1
      t.string :type2
      t.string :move1
      t.string :move2
      t.string :move3
      t.string :move4
      t.string :item
      t.string :effort_values
      t.string :character
      t.integer :lap1_flag
      t.integer :lap2_flag
      t.integer :lap3_flag
      t.integer :lap4_flag
      t.integer :lap5_flag
      t.integer :lap6_flag
      t.integer :lap7_flag
      t.integer :lap8_flag

      t.timestamps
    end
  end
end

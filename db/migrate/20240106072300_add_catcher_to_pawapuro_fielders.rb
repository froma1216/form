class AddCatcherToPawapuroFielders < ActiveRecord::Migration[7.0]
  def change
    add_column :pawapuro_fielders, :catcher, :integer
  end
end

class AddPlantNumberToStates < ActiveRecord::Migration[6.0]
  def change
    add_column :states, :plant_number, :integer
  end
end

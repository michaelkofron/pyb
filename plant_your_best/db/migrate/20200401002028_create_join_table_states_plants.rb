class CreateJoinTableStatesPlants < ActiveRecord::Migration[6.0]
  def change
    create_join_table :states, :plants do |t|
      t.index [:state_id, :plant_id]
      t.index [:plant_id, :state_id]
    end
  end
end

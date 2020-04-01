class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :com_name
      t.string :sci_name
      t.string :fam_name
    end
  end
end
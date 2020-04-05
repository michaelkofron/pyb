class AddWikiToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :wiki, :string
  end
end
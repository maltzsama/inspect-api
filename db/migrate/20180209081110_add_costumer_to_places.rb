class AddCostumerToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_reference :places, :costumer, foreign_key: true
  end
end

class AddPlaceToInspections < ActiveRecord::Migration[5.1]
  def change
    add_reference :inspections, :place, foreign_key: true
  end
end

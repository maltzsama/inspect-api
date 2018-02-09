class AddInspectionToOccurrences < ActiveRecord::Migration[5.1]
  def change
    add_reference :occurrences, :inspection, foreign_key: true
  end
end

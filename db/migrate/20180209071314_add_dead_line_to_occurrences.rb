class AddDeadLineToOccurrences < ActiveRecord::Migration[5.1]
  def change
    add_reference :occurrences, :deadline, foreign_key: true
  end
end

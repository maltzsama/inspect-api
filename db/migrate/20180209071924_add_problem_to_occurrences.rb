class AddProblemToOccurrences < ActiveRecord::Migration[5.1]
  def change
    add_reference :occurrences, :problem, foreign_key: true
  end
end

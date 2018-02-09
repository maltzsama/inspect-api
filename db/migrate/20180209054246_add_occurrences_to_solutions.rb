class AddOccurrencesToSolutions < ActiveRecord::Migration[5.1]
  def change
    add_reference(:solutions, :occurrence, index: { unique: true },  
      foreign_key: {:to_table => "occurrences"})
  end
end

class CreateOccurrences < ActiveRecord::Migration[5.1]
  def change
    create_table :occurrences do |t|
      t.string :description

      t.timestamps
    end
  end
end

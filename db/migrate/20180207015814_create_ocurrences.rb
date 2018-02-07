class CreateOcurrences < ActiveRecord::Migration[5.1]
  def change
    create_table :ocurrences do |t|
      t.string :description

      t.timestamps
    end
  end
end

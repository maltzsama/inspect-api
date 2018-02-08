class AddPictureToOccurrences < ActiveRecord::Migration[5.1]
  def change
    add_column :occurrences, :picture, :string
  end
end

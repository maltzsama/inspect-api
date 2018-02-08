class AddPictureToSolutions < ActiveRecord::Migration[5.1]
  def change
    add_column :solutions, :picture, :string
  end
end

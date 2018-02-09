class AddUserToCostumer < ActiveRecord::Migration[5.1]
  def change
    add_reference :costumers, :user, foreign_key: true
  end
end

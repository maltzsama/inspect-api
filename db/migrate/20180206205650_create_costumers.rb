class CreateCostumers < ActiveRecord::Migration[5.1]
  def change
    create_table :costumers do |t|
      t.string :name
      t.string :cnpj
      t.string :address
      t.string :contact
      t.string :fone

      t.timestamps
    end
  end
end

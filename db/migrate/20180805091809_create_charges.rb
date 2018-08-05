class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.string :name
      t.decimal :price, precision: 11, scale: 2, null: false
      t.string :amount
      t.integer :category
      t.date :date

      t.timestamps
    end
  end
end

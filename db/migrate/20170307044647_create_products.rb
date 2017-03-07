class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price, precision: 12, scale: 2
      t.string :comments

      t.timestamps
    end
  end
end

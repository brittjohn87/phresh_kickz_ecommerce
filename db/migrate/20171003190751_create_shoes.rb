class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :name
      t.decimal :price
      t.integer :size
      t.integer :quantity
      t.text :description
      t.string :brand
      t.integer :category_id

      t.timestamps
    end
  end
end

class AddQuantityToSizes < ActiveRecord::Migration[5.1]
  def change
    add_column :sizes, :quantity, :integer
  end
end

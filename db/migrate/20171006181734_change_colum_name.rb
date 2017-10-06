class ChangeColumName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :line_items, :product_id, :shoe_id
  end
end

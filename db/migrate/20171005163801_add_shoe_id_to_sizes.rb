class AddShoeIdToSizes < ActiveRecord::Migration[5.1]
  def change
    add_column :sizes, :shoe_id, :integer
  end
end

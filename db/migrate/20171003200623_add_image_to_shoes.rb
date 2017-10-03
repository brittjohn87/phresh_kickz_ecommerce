class AddImageToShoes < ActiveRecord::Migration[5.1]
  def change
    add_column :shoes, :image, :string
  end
end

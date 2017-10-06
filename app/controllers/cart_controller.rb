class CartController < ApplicationController
  def add_to_cart
  	line_item = LineItem.create(shoe_id: params[:shoe_id], quantity: params[:quantity])

  	line_item.update(line_item_total: (line_item.quantity * line_item.shoe.price))

  	redirect_back(fallback_location: root_path)
  end

  def view_order
  	@line_items = LineItem.all
  end

  def checkout
  end
end

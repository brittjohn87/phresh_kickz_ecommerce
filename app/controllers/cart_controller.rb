class CartController < ApplicationController
  def add_to_cart
    if params[:quantity].to_i == 0
      flash[:notice] = "Please enter a valid quantity to add to cart!"
      redirect_back(fallback_location: root_path)

    else

    	line_item = LineItem.create(shoe_id: params[:shoe_id], quantity: params[:quantity])

    	line_item.update(line_item_total: (line_item.quantity * line_item.shoe.price))

    	redirect_back(fallback_location: root_path)
    end
  end

  def view_order
  	@line_items = LineItem.all
  end

  def checkout
    line_items = LineItem.all
    @order = Order.create(user_id: current_user.id, subtotal: 0)

    puts "********************************"

    line_items.each do |line_item|
      line_item.shoe.update(quantity: (line_item.shoe.quantity - line_item.quantity))
      @order.order_items[line_item.shoe_id] = line_item.quantity 
      @order.subtotal += line_item.line_item_total
    end
  @order.save

  @order.update(sales_tax: (@order.subtotal * 0.08))
  @order.update(grand_total: (@order.sales_tax + @order.subtotal))

  line_items.destroy_all
  end

  def order_complete
    @order = Order.find(params[:order_id])
    @amount = (@order.grand_total.to_f.round(2) * 100).to_i

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Fire from Phresh Kickz',
      :currency => 'usd'
    )

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart_path
  end

  def edit_line_item
    # @order = current_order
    line_item = LineItem.find_by(shoe_id: params[:shoe_id].to_i)
    line_item.update(quantity: params[:quantity].to_i)
    line_item.update(line_item_total: line_item.quantity * line_item.shoe.price)

    redirect_back(fallback_location: view_order) 

  end 

  def delete_line_item
    # @order = current_order
    line_item = LineItem.where(shoe_id: params[:shoe_id].to_i).first
    line_item.destroy
    redirect_back(fallback_location: view_order)  
  end
end

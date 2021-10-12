class Public::OrdersController < ApplicationController

  def new
    @orders = Order.new
  end

  def comfirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @sum = 0
    @shipping_cost = 800
    @order.shipping_cost = 800
    @order.payment_method = params[:order][:payment_method].to_i
    @address_type = params[:order][:address_type]
    if @address_type == "2"
     @order.address = current_customer.address
     @order.postal_code = current_customer.postal_code
     @order.name = current_customer.last_name + current_customer.first_name
    elsif @address_type == "1"
     @address = Address.find(params[:order][:address_id])
     @order.address = @address.address
     @order.postal_code = @address.postal_code
     @order.name = @address.name
    elsif @address_type == "0"
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_item = current_customer.cart_items
    @cart_item.each do |cart_item|
      @order_detail = OrderDetail.new({
       order_id: @order.id,
       item_id: cart_item.item_id,
       price: cart_item.item.price,
       amount: cart_item.amount,
       making_status: 0
      })
      @order_detail.save
    end
    @cart_item.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:address,:name,:postal_code,:shipping_cost,:total_payment,:payment_method,:status)
  end
end

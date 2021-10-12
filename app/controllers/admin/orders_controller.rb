class Admin::OrdersController < ApplicationController

    def show
        @cart_item = CartItem.find(params[:id])
        @cart_items = @order.cart_items
        @order = Order.find(params[:id])
        @total_price = @cart_items.sum(:cart_items_price)
    end

    def update
        @orders = Order.all
        @order = Order.find(params[:id])
        @order.is_active=params[:order][:status].to_i
        @order.update(item_params)
        redirect_to admin_orders_path
    end

    def customer_params
    params.require(:customer).permit(:name,:postal_code,:address,:shipping_cost,:total_payment,:payment_method,:status)
    end
end

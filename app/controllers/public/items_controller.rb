class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:item]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end
end

class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @items = Item.all
    @item = Item.new(item_params)
    @item.is_active=params[:item][:is_active].to_i
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @items = Item.all
    @item = Item.find(params[:id])
    @item.is_active=params[:item][:is_active].to_i
    @item.update(item_params)
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name,:image,:introduction,:price,:genre_id)
  end
end

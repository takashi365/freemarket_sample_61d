class ItemsController < ApplicationController

  def index
    @item = Item.new
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def show
  end 

  private

  def item_params
    params.require(:item).permit( :name, :description, :price, :status, :prefecture, :expense, :shipping_method, :arrival_date)
  end

end

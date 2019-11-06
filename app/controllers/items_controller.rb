class ItemsController < ApplicationController

  def index
    @item = Item.order("created_at DESC").page(params[:item]).per(10)
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to  item_exhibit_ok_path (:item_id)
  end

  def exhibit_ok
  end

  def show
    @item = Item.find(params[:id])
  end 

  def purchase_page
    @item = Item.find(params[:item_id])
  end

  private

  def item_params
    params.require(:item).permit( :name, :description, :price, :status, :prefecture, :expense, :shipping_method, :arrival_date)
  end

end

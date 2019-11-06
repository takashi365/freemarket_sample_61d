class ItemsController < ApplicationController
before_action :set_item,  only:[:show]
  def index
    @item = Item.order("created_at DESC").page(params[:item]).per(10)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to item_exhibit_ok_path (:item_id)
    else
      render action: :new
    end

  end

  def exhibit_ok
  end

  def show
  end 

  def purchase_page
    @item = Item.find(params[:item_id])
  end

  private

  def item_params
    params.require(:item).permit( :name, :description, :price, :status, :prefecture, :expense, :shipping_method, :arrival_date)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

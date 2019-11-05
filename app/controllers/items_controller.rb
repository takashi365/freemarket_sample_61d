class ItemsController < ApplicationController
  before_action  except: :index
  def index
    @item = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path 
  end

  def exhibit_ok
  end

  def show
  end 

  private

  def item_params
    params.require(:item).permit( :name, :description, :price, :status, :prefecture, :expense, :shipping_method, :arrival_date)
  end

end

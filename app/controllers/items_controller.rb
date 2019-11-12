class ItemsController < ApplicationController
before_action :set_item, only:[:show]
before_action :set_purchase,  only:[:purchase_page]

  def index
    @item = Item.order("created_at DESC").page(params[:item]).per(10)
  end
  
  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
    if @item.save
      params[:images][:image_url].each do |image|
        @item.images.create(image_url: image, item_id: @item.id)
      end
      format.html{redirect_to item_exhibit_ok_path(@item)}
    else
     
      format.html{render action: :new}
      
      end
    end
  end

  def exhibit_ok
  end

  def show
  end 

  def purchase_page
  end

  def images_up
  end

  private

  def item_params
    params.require(:item).permit( :name, :description, :price, :status, :prefecture, :expense, :shipping_method, :arrival_date, images_attributes:[:id, :image_url])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

end

class ItemsController < ApplicationController
before_action :set_item, only:[:show]
before_action :set_purchase,  only:[:purchase_page]

  def index
    @item = Item.order("created_at DESC").page(params[:item]).per(10)
  end
  
  def new
    @item = Item.new
    @item.images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.category_name
    end
  end


  def get_category_children
    @category_children = Category.find_by(category_name: "#{params[:parent_name]}", ancestry: nil).children
  end
  
  def get_category_grandchildren
    @category_granschildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    # respond_to do |format|
    if @item.save
      # params[:images][:image_url].each do |image|
      #   @item.images.create(image_url: image, item_id: @item.id)
      # end
      # format.html{redirect_to item_exhibit_ok_path(@item)}
      redirect_to item_exhibit_ok_path(@item)
    else
     
      # format.html{render action: :new}
      render action: :new
  
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
    params.require(:item).permit( :name, :description, :price, :status, :prefecture, :expense, :category_id, :arrival_date, images_attributes:[:image_url])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

end



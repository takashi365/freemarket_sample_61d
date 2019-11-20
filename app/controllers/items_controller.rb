class ItemsController < ApplicationController
before_action :set_item, only:[:show]
before_action :get_parent, only:[:new,:create]
before_action :set_purchase,  only:[:purchase_page]
before_action :add_buy, only:[:purchase_pay]
before_action :authenticate_user!, only:[:new, :show]


  def index
    @item = Item.order("created_at DESC").page(params[:item]).per(10)
  end
  
  def new
    @item = Item.new
    @item.images.build
  end

  def get_category_children
    @category_children = Category.find_by(category_name: "#{params[:parent_name]}", ancestry: nil).children
  end
  
  def get_category_grandchildren
    @category_granschildren = Category.find("#{params[:child_id]}").children
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
      @item.images.build
      format.html{render action: 'new'}
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def exhibit_ok
  end

  def show
    @category = Category.all
    @user_items= Item.where(seller_id: @item.seller.id).order("created_at DESC").page(params[:item]).per(6)
  end 

  def purchase_page
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.aws[:pay_secret_key]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.customer_card)
  end

  def images_up
  end

  def purchase_pay
  end

  def add_buy
    @item = Item.find(params[:item_id])
    @item.update( buyer_id: current_user.id)
  end

  private

  def item_params
    params.require(:item).permit( :name, :description, :price, :status, :prefecture, :expense, :category_id,:seller_id, :arrival_date, images_attributes:[:image_url]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def get_parent
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.category_name
    end
  end
  
end



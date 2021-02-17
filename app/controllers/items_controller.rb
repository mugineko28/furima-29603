class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new, :create, :edit, :update ]
 before_action :set_item, only: [:show, :edit, :update ] 

def index
  @items = Item.order("created_at DESC")
end

def new
  @item = Item.new
end

def show
end

def edit
  if current_user.id != @item.user_id
     redirect_to root_path
  end

end

def update
  if @item.update(item_params)
    render :show
  else
    render :edit
  end
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end

 private
  def item_params
    params.require(:item).
     permit(:name, :details, :image, :price, :category_id, :status_id, 
            :shipping_charges_id, :prefecture_id, :day_to_skip_id)
            .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

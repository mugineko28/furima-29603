class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:new ]
 #before_action :move_to_index, expect: [:new, :create]


def index
  @items = Item.all
end

def new
  @item = Item.new
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
end

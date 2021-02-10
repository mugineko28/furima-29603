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
  Item.create(item_params)
end


 private
  def item_params
    params.require(:item).
    permit(:user,:name, :image, :details, :price, 
           :category_id, :status_id, :shipping_charges_id, :prefecture_id, :day_to_skip_id)
  end
end

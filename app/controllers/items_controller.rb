class ItemsController < ApplicationController

def index
  @items = Item.all
end

def new
  @items = Item.new
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

class PurchaseInformationController < ApplicationController
before_action :item_image, only: [:index, :create]

  def index
    if @item.purchase_information.present?
      redirect_to root_path
    end
    @address_form = AddressForm.new
  end

  def create
    @address_form = AddressForm.new(item_params)
    if @address_form.valid?
       @address_form.save
      redirect_to root_path
    else 
      render action: :index
    end
  end


private
  def item_params
  params.require(:address_form).
   permit(:street_address, :prefecture_id, :postal_code, :municipality,
          :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_image
    @item = Item.find(params[:item_id])
  end

  end

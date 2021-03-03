class PurchaseInformationController < ApplicationController
  before_action :item_image, only: [:index, :create]
  before_action :security, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @address_form = AddressForm.new
  end

  def create
    
    @address_form = AddressForm.new(item_params)
    if @address_form.valid?
      pay_item
       @address_form.save
       redirect_to root_path
    else 
      render action: :index
    end
  end


 private
  def item_params
  params.require(:address_form).
   permit(:token, :street_address, :prefecture_id, :postal_code, :municipality,
          :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_image
    @item = Item.find(params[:item_id])
  end

  def security
   if @item.purchase_information.present? || current_user == @item.user
        redirect_to root_path
    end
  end


  def pay_item
    Payjp.api_key = "PAYJP_SECRET_KEY"
    Payjp::Charge.create(
      amount: @item.price,
      card: item_params[:token],
      currency: 'jpy'
    )
  end

end

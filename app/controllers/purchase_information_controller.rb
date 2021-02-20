class PurchaseInformationController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @address_form = AddressForm.new
  end

  def create
    binding.pry
    @address_form = AddressForm.new(item_params)
    if redirect_to root_path
    end
  end


private
def item_params
  params.require(:address_form).
   permit(:street_address, :prefecture_id, :postal_code, :municipality,
          :building_name, :phone_number, :PurchaseInformation_id, 
          :user_id, :item_id)
          .merge(user_id: current_user.id)
          

end
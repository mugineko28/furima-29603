class AddressForm
  include ActiveModel::Model
  attr_accessor :token, :street_address, :prefecture_id, :postal_code, 
                :municipality, :building_name, :phone_number, :user_id, :item_id

    with_options presence: true do
     validates :user_id
     validates :item_id
     validates :token
     validates :street_address, format: {with:/\A[ぁ-んァ-ン一-龥々]/, message: "Can't be blank"}
     validates :postal_code, format: { with:/\A\d{3}[-]\d{4}\z/ , message: "is invalid. Include hyphen(-)" }
     validates :municipality,  format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid"}
     validates :phone_number, format: { with: /\A[0-9]+\z/ , message: "phone number can't be blank"}
    end

    with_options numericality: { other_than: 1 } do
      validates :prefecture_id 
    end


  def save
    
   purchase_information = PurchaseInformation.create(user_id: user_id, item_id: item_id)
    Address.create(street_address: street_address, prefecture_id: prefecture_id, 
                   postal_code: postal_code, municipality: municipality, building_name: building_name, 
                   phone_number: phone_number, purchase_information_id: purchase_information.id )
  end
end
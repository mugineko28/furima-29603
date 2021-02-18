class UserAddress
  include ActiveModel::Model
  attr_accessor :street_address, :prefecture_id, :postal_code, 
                :municipality, :building_name, :phone_number,
                :purchase_information

    with_options presence: true do
     validates :user
     validates :item
     validates :street_address, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
     validates :prefecture_id
     validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
     validates :municipality,  format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
     validates :phone_number, format: {with: /\A[0-9]+\z/}
     validates :purchase_information
    end





  def save

    Address.create(street_address: street_address, prefecture_id: prefecture_id, 
                   postal_code: postal_code, municipality: municipality, building_name: building_name, 
                   phone_number: phone_number, purchase_information:purchase_information )
    PurchaseInformation.create(user: user, item: item)
  end
end
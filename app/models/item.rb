class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :day_to_skip
  belongs_to :user
  has_one_attached :image
  has_one :purchase_information
  
    validates :name,:details,:price,:image,
              :category_id,:status_id,:shipping_charges_id,
              :prefecture_id,:day_to_skip_id, presence: true


    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charges_id
      validates :prefecture_id
      validates :day_to_skip_id
    end
    validates :price, numericality: { with: /\A[0-9]+\z/, message:"Half-width number"}
    validates_inclusion_of :price, in:(300..9_999_999), message: "Out of setting range" 
  end

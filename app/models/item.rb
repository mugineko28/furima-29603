class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
    validates :user, :name,:details,:price,
              :category_id,:status_id,:shipping_charges_id,
              :prefecture_id,:day_to_skip_id, presence: true


    with options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charges
      validates :prefeture
      validates :days_to_skip
    end
    validates_inclusion_of :price, in: 300..9_999_999

  end

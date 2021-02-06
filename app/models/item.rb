class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
    validates :user, :name,:details,:price,
              :category_id,:status_id,:shipping_charges_id,
              :prefecture_id,:day_to_skip_id, presence: true
    validates :genre_id, numericality: { other_than: 1 } 
  end

class Item < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
  validates :user
  validates :name
  validates :details
  validates :price
  validates :category_id
  validates :status_id
  validates :shipping_charges_id
  validates :day_to_skup_id
  end
  
end

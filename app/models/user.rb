class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
   validates :nickname 
   validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} 
   validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } 
   validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }  
   validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }  
   validates :birthday
 end

 validates :email, format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/ }
 validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

end


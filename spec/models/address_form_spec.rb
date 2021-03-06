require 'rails_helper'
RSpec.describe AddressForm do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @address_form = FactoryBot.build(:address_form, item_id: @item.id, user_id: @user.id)
    sleep(1)
  end

  describe '商品購入機能' do
   context '購入がうまくいくとき' do
     it 'カード情報がトークン化され、郵便番号、都道府県、市区町村、
         番地、電話番号があれば購入できる' do
         expect(@address_form).to be_valid
      end

      it "建物名が抜けていても購入できる" do
        @address_form.building_name = ""
        expect(@address_form).to be_valid
      end
  end

   context '購入が失敗するとき' do
     it 'カード情報に不備があるとき' do
       @address_form.token = ""
       @address_form.valid?
       expect(@address_form.errors.full_messages).to include("Token can't be blank")
     end

     it "郵便番号が空では購入できない" do
       @address_form.postal_code = ""
       @address_form.valid?
       expect(@address_form.errors.full_messages).to include("Postal code can't be blank")
     end

     it '郵便番号が-なしでは購入できない' do
      @address_form.postal_code = "1111111" 
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Postal code is invalid")
     end

     it "都道府県が選択されていないと購入できない" do
       @address_form.prefecture_id = ""
       @address_form.valid?
       expect(@address_form.errors.full_messages).to include("Prefecture is not a number")
     end

     it "都道府県が1では登録できない" do
       @address_form.prefecture_id = 1
       @address_form.valid?
       expect(@address_form.errors.full_messages).to include("Prefecture must be other than 1")
     end

     it "市区町村が空では購入できない" do
       @address_form.municipality = ""
       @address_form.valid?
       expect(@address_form.errors.full_messages).to include("Municipality can't be blank")
     end

     it "番地が空では購入できない" do
      @address_form.street_address = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Street address can't be blank")
     end

     it "建物名が抜けていても購入できる" do
      @address_form.building_name = ''
      expect(@address_form).to be_valid
    end

     it "電話番号が空では購入できない" do
       @address_form.phone_number = ""
       @address_form.valid?
       expect(@address_form.errors.full_messages).to include("Phone number can't be blank")
     end

     it "電話番号が12桁以上では購入できない" do
       @address_form.phone_number = 123456789123
       @address_form.valid?
       expect(@address_form.errors.full_messages).to include("Phone number is invalid")
     end

     it "電話番号が英数混合では購入できない" do
       @address_form.phone_number = "1a1a1a1a1a1"
       @address_form.valid?
       expect(@address_form.errors.full_messages).to include("Phone number is invalid")
     end

     it "user_idが空では購入できない" do
       @address_form.user_id = ""
       @address_form.valid?
       expect(@address_form.errors.full_messages).to include("User can't be blank")
     end

     it "item_idが空では購入できない" do
      @address_form.item_id = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Item can't be blank")
    end
   end
  end
end
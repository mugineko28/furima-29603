require 'rails_helper'
RSpec.describe Item do
  before do
    @item = FactoryBot.build(:item)
  
  end

 describe '商品出品機能' do
  context '出品がうまくいくとき' do
    it "nameとimageとprice、category_id, status_id, 
       shipping_charges_id, prefecture_id, day_to_skip_idがあれば出品できる" do
      expect(@item).to be_valid
    end
  end
  context '商品出品がうまくいかないとき' do
    it "nameがないと出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "imageがないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "detailsがないと出品できない" do
      @item.details = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Details can't be blank")
    end

    it "priceがないと出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが全角だと出品できない" do
      @item.price = "1００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが299円以下だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが10,000,000円以上だと出品できない" do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end


    it "category_idが選択されていないければ出品できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "category_idが1では出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "status_idが選択されていなければ出品できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "status_idが1では出品できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "shipping_charges_idが選択されていなければ出品できない" do
      @item.shipping_charges_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges is not a number")
    end

    it "shipping_charges_idが1では出品できない" do
      @item.shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
    end


    it "prefecture_idが選択されていなければ出品できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "prefecture_idが1では出品できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "day_to_skip_idが選択されていなければ出品できない" do
      @item.day_to_skip_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to skip can't be blank")
    end

    it "day_to_skip_idが1では出品できない" do
      @item.day_to_skip_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to skip must be other than 1")
    end
  end
 end
end

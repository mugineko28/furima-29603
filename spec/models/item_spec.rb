require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '商品出品機能' do
  context '出品がうまくいくとき' do
    it "nameとimageとprice、category_id, status_id, 
       shipping_charges_id, prefecture_id, day_to_skip_idがそれぞれ存在する" do
    expect(@items).to be_valid
  end

end

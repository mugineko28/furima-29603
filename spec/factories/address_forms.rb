FactoryBot.define do
  factory :address_form do
    token                             {'tok_1234567'}
    postal_code                       {'123-4567'}
    municipality                      {'赤崎市青海町'}
    street_address                    {'緑通1-1-1'}
    building_name                     {'白ビル111'}
    phone_number                      {'12345678912'}
    prefecture_id                     {4}
  end
end

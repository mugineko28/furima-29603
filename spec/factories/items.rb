FactoryBot.define do
  factory :item do

    name                       {"オムレツ"}
    price                      {1000}
    details                    {"パパイヤ入ってます"}
    category_id                {10}
    status_id                  {3}
    shipping_charges_id        {2}
    prefecture_id              {29}
    day_to_skip_id             {2}
    association :user




    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

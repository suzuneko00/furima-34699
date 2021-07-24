FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('./app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
    name { 'カメラ' }
    comment { '新品未使用品です。' }
    price { 25000 }
    category_id { 2 }
    condition_id { 2 }
    delivery_charge_id { 2 }
    area_id { 2 }
    delivery_date_id { 2 }
  end
end
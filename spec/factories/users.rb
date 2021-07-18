FactoryBot.define do
  factory :user do
    nickname { 'yata' }
    email { Faker::Internet.free_email }
    password {'s123456' }
    password_confirmation { 's123456' }
    last_name { '山田' }
    first_name { '太朗' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { '19651123' }
  end
end

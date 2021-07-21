class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :comment
    validates :category_id
    validates :condition_id
    validates :delivery_charges_id
    validates :area_id
    validates :delivery_date_id
    validates :price
    validates :user_id
  end
end

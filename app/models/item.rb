class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :comment
    validates :category_id
    validates :condition_id
    validates :delivery_charges_id
    validates :area_id
    validates :delivery_date_id
    validates :price
  end
    user, references: foreign_key: true
end

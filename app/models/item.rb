class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :name
    validates :comment
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  end
end

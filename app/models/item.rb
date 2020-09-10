class Item < ApplicationRecord
  belongs_to :user

  scope :filter_by_not_sold, -> () {where sold: false}
  scope :filter_by_shipping, -> () {where shipping: true}
  scope :filter_by_pickup, -> () {where pickup: true}
  scope :filter_by_category, -> (category) {where category: category}
  scope :filter_by_condition, -> (condition) {where condition: condition}

end

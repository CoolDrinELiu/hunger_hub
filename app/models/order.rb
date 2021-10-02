class Order < ApplicationRecord
  enum category: {common: 0, bulk: 1}

  belongs_to :user, optional: true

  has_many :order_with_foods
  has_many :foods, through: :order_with_foods, source: :food
end

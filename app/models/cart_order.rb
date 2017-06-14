class CartOrder < ApplicationRecord
  belongs_to :user
  has_many :cart_order_jewels
  has_many :jewels, through: :cart_order_jewels
  scope :active, -> { where(status: "active") }
end

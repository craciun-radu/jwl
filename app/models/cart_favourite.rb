class CartFavourite < ApplicationRecord
  belongs_to :user
  has_many :cart_favourite_jewels
  has_many :jewels, through: :cart_favourite_jewels
end

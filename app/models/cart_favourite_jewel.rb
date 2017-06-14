class CartFavouriteJewel < ApplicationRecord
  belongs_to :jewel
  belongs_to :cart_favourite
end

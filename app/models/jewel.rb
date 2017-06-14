class Jewel < ApplicationRecord
  belongs_to :category
  has_many :cart_order_jewels
  has_many :cart_orders, through: :cart_order_jewels
  has_many :cart_order_favourites
  has_many :cart_favourites, through: :cart_order_favourites
  
  mount_uploader :image, PhotoUploader
  
  def category_name
    self.category.name rescue "Undefined"
  end
end

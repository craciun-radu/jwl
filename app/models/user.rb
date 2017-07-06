class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :cart_orders
  has_many :cart_favourites
  has_many :user_addresses
  
  def regular?
    return self.user_type == "regular"
  end
  
  def owner?
    return !self.regular?
  end
  
  def pretty_name
    if current_language == "en"
      return "#{self.first_name} #{self.last_name}"
    else
      return "#{self.last_name} #{self.first_name}"
    end
  end
  
  def create_new_cart_order
    cart_order = CartOrder.create(user_id: self.id)
    return cart_order
  end

  def create_new_cart_favourite
    cart_favourite = CartFavourite.create(user_id: self.id)
    return cart_favourite
  end
end

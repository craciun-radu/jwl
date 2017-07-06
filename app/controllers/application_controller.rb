class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :load_cart_order, :load_cart_favourite
  before_action :load_list_of_jewels_in_cart_order, :load_list_of_jewels_in_cart_favourites
  
  def translate(attr)
    return "" if attr.blank?
    return I18n.t(attr)
  end

  def current_language
    return I18n.locale.to_s
  end
  
  private
    def set_locale
      I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
      session[:locale] = I18n.locale
    end

   def default_url_options(options={})
     logger.debug "default_url_options is passed options: #{options.inspect}\n"
     { locale: I18n.locale }
   end
   
   def load_cart_order
     return if current_user.blank?
     @cart_order = current_user.cart_orders.active.last || current_user.create_new_cart_order
   end

   def load_cart_favourite
     return if current_user.blank?
     @cart_favourite = current_user.cart_favourites.last || current_user.create_new_cart_favourite
   end

   def load_list_of_jewels_in_cart_order
     return if current_user.blank?
     cart_order_jewels = @cart_order.cart_order_jewels
     @jewels_in_cart_order = {}
     cart_order_jewels.each do |coj|
       jew = coj.jewel
       @jewels_in_cart_order[coj.jewel_id] = {}
       @jewels_in_cart_order[coj.jewel_id]['name'] = jew.name
       @jewels_in_cart_order[coj.jewel_id]['price'] = jew.price
       @jewels_in_cart_order[coj.jewel_id]['image_url'] = jew.image_url
       @jewels_in_cart_order[coj.jewel_id]['quantity'] = coj.quantity
     end
   end

   def load_list_of_jewels_in_cart_favourites
     return if current_user.blank?
     cart_favourite_jewels = @cart_favourite.cart_favourite_jewels
     @jewels_in_cart_favourite = {}
     cart_favourite_jewels.each do |coj|
       jew = coj.jewel
       @jewels_in_cart_favourite[coj.jewel_id] = {}
       @jewels_in_cart_favourite[coj.jewel_id]['name'] = jew.name
       @jewels_in_cart_favourite[coj.jewel_id]['image_url'] = jew.image_url
     end
   end
end

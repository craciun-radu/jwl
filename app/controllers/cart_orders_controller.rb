class CartOrdersController < ApplicationController
  
  def show
    @cart_order = CartOrder.find_by_id(params[:id])
    redirect_to root_path if !defined?(current_user) || current_user.id != @cart_order.user_id
    in_cart = CartOrderJewel.where(cart_order_id: @cart_order.id)
    
    @jewels = Jewel.where(id: in_cart.map(&:jewel_id))
    @addresses = current_user.user_addresses
    @new_address = @addresses.last || UserAddress.new()
  end
  
  def index
    @cart_orders = current_user.cart_orders
  end
  
  def add_jewel
    @cart_order = CartOrder.find_by_id(params[:cart_order_id])
    redirect_to root_path if !defined?(current_user) || current_user.id != @cart_order.user_id
    @jewel = Jewel.find_by_id(params[:jewel_id])
    in_cart = CartOrderJewel.where(cart_order_id: @cart_order.id, jewel_id: @jewel.id).first    
    @quantity_only = in_cart.present?
    if in_cart.present?
      in_cart.quantity += 1 if @jewel.quantity > in_cart.quantity
      in_cart.save
    else
      in_cart = CartOrderJewel.new(cart_order_id: @cart_order.id, jewel_id: @jewel.id)
      in_cart.save
      @jewel_in_cart_order = {}
      @jewel_in_cart_order['name'] = @jewel.name
      @jewel_in_cart_order['price'] = @jewel.price
      @jewel_in_cart_order['image_url'] = @jewel.image_url
      @jewel_in_cart_order['quantity'] = in_cart.quantity
    end

    @in_cart = in_cart
    respond_to do |format|
      format.js{ }
      format.html{ render nothing: true}
    end
  end
  
  def remove_jewel
    @cart_order = CartOrder.find_by_id(params[:cart_order_id])
    redirect_to root_path if !defined?(current_user) || current_user.id != @cart_order.user_id
    @jewel = Jewel.find_by_id(params[:jewel_id])
    in_cart = CartOrderJewel.where(cart_order_id: @cart_order.id, jewel_id: @jewel.id).first    
    in_cart.destroy
    @empty_cart = CartOrderJewel.where(cart_order_id: @cart_order.id).length == 0
  end

  def add_address
  end
  
  def send_order
    params.permit!
    @user_address = UserAddress.new(params[:user_address])
    @user_address.user_id = current_user.id
    @user_address.save
    @cart_order.update_attribute(:status, "sent")
    @cart_order.cart_order_jewels.each do |coj|
      jewel = coj.jewel
      jewel.quantity -= coj.quantity
      jewel.save
    end
    redirect_to cart_orders_path()
  end
end

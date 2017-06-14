class CartOrdersController < ApplicationController
  
  def add_jewel
    @cart_order = CartOrder.find_by_id(params[:cart_order_id])
    @jewel = Jewel.find_by_id(params[:jewel_id])
    in_cart = CartOrderJewel.where(cart_order_id: @cart_order.id, jewel_id: @jewel.id).first    
    @quantity_only = in_cart.present?
    if in_cart.present?
      in_cart.quantity += 1
      in_cart.save
    else
      in_cart = CartOrderJewel.new(cart_order_id: @cart_order.id, jewel_id: @jewel.id)
      in_cart.save
      @jewel_in_cart_order = {}
      @jewel_in_cart_order['name'] = @jewel.name
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
    @jewel = Jewel.find_by_id(params[:jewel_id])
    in_cart = CartOrderJewel.where(cart_order_id: @cart_order.id, jewel_id: @jewel.id).first    
    in_cart.destroy
  end
end

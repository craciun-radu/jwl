class CartFavouritesController < ApplicationController
  
  def add_jewel
    @jewel = Jewel.find_by_id(params[:jewel_id])
    @existent = CartFavouriteJewel.where(cart_favourite_id: @cart_favourite.id, jewel_id: @jewel.id).present?
    if !@existent
      in_cart = CartFavouriteJewel.new(cart_favourite_id: @cart_favourite.id, jewel_id: @jewel.id)
      in_cart.save
      @jewel_in_cart_favourite = {}
      @jewel_in_cart_favourite['name'] = @jewel.name
      @jewel_in_cart_favourite['image_url'] = @jewel.image_url
    end
    respond_to do |format|
      format.js{ }
      format.html{ render nothing: true}
    end
  end

  def remove_jewel
    @cart_favourite = CartFavourite.find_by_id(params[:cart_favourite_id])
    @jewel = Jewel.find_by_id(params[:jewel_id])
    in_cart = CartFavouriteJewel.where(cart_favourite_id: @cart_favourite.id, jewel_id: @jewel.id).first
    in_cart.destroy
  end
  
end

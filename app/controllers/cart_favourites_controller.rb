class CartFavouritesController < ApplicationController
  
  def add_jewel
    @jewel = Jewel.find_by_id(params[:jewel_id])


    respond_to do |format|
      format.js{ }
      format.html{ render nothing: true}
    end
  end
  
end

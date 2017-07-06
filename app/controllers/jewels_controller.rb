class JewelsController < ApplicationController
  before_action :load_categories, only: ["new", "edit"]
  
  def new
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    @jewel = Jewel.new()
  end
  
  def create
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    params.permit!
    @jewel = Jewel.new(params[:jewel])
    @jewel.save
    redirect_to new_jewel_path()
  end
  
  def edit
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    @jewel = Jewel.find_by_id(params[:id])    
  end
  
  def update
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    params.permit!
    @jewel = Jewel.find_by_id(params[:id])
    @jewel.update(params[:jewel])
    redirect_to jewels_path
  end
  
  def index
    @jewels = Jewel.all.order(:created_at)
  end
  
  def destroy
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    jewel = Jewel.find_by_id(params[:id])
    jewel.destroy
    redirect_to jewels_path
  end
  
  private
    def load_categories
      @categories = Category.all.order(:name).map{|c| [c.name, c.id]}
    end
end

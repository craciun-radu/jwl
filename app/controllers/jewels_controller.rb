class JewelsController < ApplicationController
  before_action :load_categories, only: ["new", "edit"]
  
  def new
    @jewel = Jewel.new()
  end
  
  def create
    params.permit!
    @jewel = Jewel.new(params[:jewel])
    @jewel.save
    redirect_to new_jewel_path()
  end
  
  def edit
    @jewel = Jewel.find_by_id(params[:id])    
  end
  
  def update
    params.permit!
    @jewel = Jewel.find_by_id(params[:id])
    @jewel.update(params[:jewel])
    redirect_to root_path
  end
  
  def index
    @jewels = Jewel.all.order(:created_at)
  end
  
  def destroy
    jewel = Jewel.find_by_id(params[:id])
    jewel.destroy
    redirect_to root_path
  end
  
  private
    def load_categories
      @categories = Category.all.order(:name).map{|c| [c.name, c.id]}
    end
end

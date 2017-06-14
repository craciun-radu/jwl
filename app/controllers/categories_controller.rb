class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.order(:name)
    @categories_hash = Jewel.all.map(&:category_id).group_by{|i| i}.map{|k, v| [k, v.count]}.to_h
  end
  
  def new
    @category = Category.new()
  end
  
  def create
    params.permit!
    @category = Category.new(params[:category])
    @category.save
    redirect_to new_category_path()
  end
  
  def edit
    @category = Category.find(params[:id])
  end

  def update
    params.permit!
    @category = Category.find(params[:id])
    @category.update(params[:category])
    redirect_to root_path()
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
end

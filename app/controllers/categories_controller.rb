class CategoriesController < ApplicationController
  
  def index
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    @categories = Category.all.order(:name)
    @categories_hash = Jewel.all.map(&:category_id).group_by{|i| i}.map{|k, v| [k, v.count]}.to_h
  end
  
  def new
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    @category = Category.new()
  end
  
  def create
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    params.permit!
    @category = Category.new(params[:category])
    @category.save
    redirect_to new_category_path()
  end
  
  def edit
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    @category = Category.find(params[:id])
  end

  def update
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    params.permit!
    @category = Category.find(params[:id])
    @category.update(params[:category])
    redirect_to jewels_path()
  end
  
  def destroy
    redirect_to root_path if !defined?(current_user) || current_user.regular?
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
end

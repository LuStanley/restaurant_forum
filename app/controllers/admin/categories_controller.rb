class Admin::CategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    #@page = params[:page] || 1
    #@restaurants=Restaurant.order("updated_at DESC").page(params[:page]).per(10)
    @categories = Category.page(params[:page]).per(10)
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "category was successfully created"
      redirect_to admin_categories_path
    else
      flash[:alert] = "category was failed to create"
      @categories = Category.all.page(params[:page]).per(10)
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:id, :name)
  end

end

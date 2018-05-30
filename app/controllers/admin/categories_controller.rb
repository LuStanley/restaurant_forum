class Admin::CategoriesController < Admin::BaseController

  before_action :set_category, only: [:update, :destroy]

  def index
    #@page = params[:page] || 1
    #@restaurants=Restaurant.order("updated_at DESC").page(params[:page]).per(10)
    @categories = Category.page(params[:page]).per(10)

    if params[:id]
      set_category
      #@category = Category.find(params[:id])
    else
      @category = Category.new
    end
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

  def update
    #@category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "category was successfully updated"

      redirect_to admin_categories_path
    else
      @categories = Category.page(params[:page]).per(10)
      flash[:alert] = "category was failed to updated"
      redirect_to admin_categories_path
    end
  end

  def destroy
    #@category = Category.find(params[:id])
    @category.destroy
    flash[:alert] = "category was deleted"
    redirect_to admin_categories_path

  end

  private

  def category_params
    params.require(:category).permit(:id, :name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end

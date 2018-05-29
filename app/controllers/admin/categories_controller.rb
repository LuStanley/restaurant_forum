class Admin::CategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    #@page = params[:page] || 1
    #@restaurants=Restaurant.order("updated_at DESC").page(params[:page]).per(10)
    @categories = Category.page(params[:page]).per(10)
  end

end

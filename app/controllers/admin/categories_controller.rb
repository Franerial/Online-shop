class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    flash.now[:notice] = "New category successfully added!" if @category.save
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end

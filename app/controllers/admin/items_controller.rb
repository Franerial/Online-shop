class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def show; end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    flash.now[:notice] = "New item successfully added!" if @item.save
  end

  def items_by_category
    if params[:category_id].blank?
      @items = Item.all
    else
      @items = Item.items_by_category(params[:category_id])
    end

    render :index
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category_id)
  end
end

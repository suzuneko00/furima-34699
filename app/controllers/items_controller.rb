class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params) 
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :price)
  end

end

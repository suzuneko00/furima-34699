class ItemsController < ApplicationController
  
  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = @user.item.new(item_params)
    if @item.save
      redirect_to user_items_path(@user)
    else
      render :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :comment, :category_id, :condition_id, :delivery_charges_id, :area_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

end

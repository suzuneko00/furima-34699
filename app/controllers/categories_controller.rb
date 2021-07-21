class CategoriesController < ApplicationController
  def index
    @categories = Category.order("created_at DESC")
  end

  def new
  end
end

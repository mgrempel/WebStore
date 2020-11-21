class CategoriesController < ApplicationController
  def show
    @category = Category.includes(:items).find(params[:id])
    @products = @category.items
  end
end

class CategoriesController < ApplicationController
  def show
    @action = params[:id].to_s + action_name
    @search_options = ["All", "Newest", "Recently Updated", "On Sale"]
    @current_selection = (params[:option] || @search_options[0])
    @category = Category.includes(:items).find(params[:id])
    @products = @category.items

    unless params[:option] == "All" || params[:option].nil?
      @products = if params[:option] == "Newest"
                    @products.where("created_at > ?", 3.days.ago)
                  elsif params[:option] == "Recently Updated"
                    @products.where("updated_at > ? AND created_at < ?", 3.days.ago, 3.days.ago)
                  elsif params[:option] == "On Sale"
                    @products.where.not(markdown: 0)
                  end
    end
    @products = @products.page(params[:page])
  end
end

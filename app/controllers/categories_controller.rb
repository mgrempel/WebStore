class CategoriesController < ApplicationController
  def show
    @action = params[:id].to_s + action_name
    @search_options = ["All", "Newest", "Recently Updated", "On Sale"]
    @current_selection = (params[:option] || @search_options[0])
    @category = Category.includes(:items).find(params[:id])
    @products = @category.items

    unless params[:option] == "All" || params[:option].nil?
      @products = if params[:option] == "Newest"
                    @products.where("items.created_at > ?", 3.days.ago)
                  elsif params[:option] == "Recently Updated"
                    @products.where("items.updated_at > ? AND items.created_at < ?", 3.days.ago, 3.days.ago)
                  elsif params[:option] == "On Sale"
                    @products.where.not(markdown: 0)
                  end
    end

    unless params[:search] == "" || params[:search].nil?
      @products = @products.where("items.name LIKE ?", "%#{params[:search]}%").or(@products.where("description LIKE ?", "%#{params[:search]}%"))
    end

    @products = @products.page(params[:page])
  end
end

class HomeController < ApplicationController
  def index
    @action = action_name
    @search_options = ["All", "Newest", "Recently Updated", "On Sale"]
    @current_selection = (params[:option] || @search_options[0])
    @products = Item.includes(:categories).all

    unless params[:option] == "All" || params[:option].nil?
      @products = if params[:option] == "Newest"
                    @products.where("created_at > ?", 3.days.ago)
                  elsif params[:option] == "Recently Updated"
                    @products.where("updated_at > ?", 3.days.ago)
                  elsif params[:option] == "On Sale"
                    @products.where.not(markdown: 0)
                  end
    end
    @products = @products.page(params[:page])
    @categories = Category.all
  end

  def about
    @about = About.first
  end

  def contact
    @contact = Contact.first
  end

  def search

  end
end

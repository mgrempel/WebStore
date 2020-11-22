class HomeController < ApplicationController
  def index
    @search_options = ["Newest", "Recently Updated", "On Sale"]
    @current_selection = (params[:option] || @search_options[0])
    @products = Item.all
    @categories = Category.all
  end

  def about
    @about = About.first
  end

  def contact
    @contact = Contact.first
  end
end

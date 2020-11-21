class HomeController < ApplicationController
  def index
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

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
                    @products.where("updated_at > ? AND created_at < ?", 3.days.ago, 3.days.ago)
                  elsif params[:option] == "On Sale"
                    @products.where.not(markdown: 0)
                  end
    end

    unless params[:search] == "" || params[:search].nil?
      @products = @products.where("name LIKE ?", "%#{params[:search]}%").or(@products.where("description LIKE ?", "%#{params[:search]}%"))
    end

    @products = @products.page(params[:page]).order("id DESC")
    @categories = Category.all
  end

  def about
    @about = About.first
  end

  def contact
    @contact = Contact.first
  end

  def search
    @action = action_name

    @search_options = ["All", "Newest", "Recently Updated", "On Sale"]
    @current_selection = (params[:option] || @search_options[0])

    @categories = Category.pluck(:name)
    @category_selection = (params[:category] || "")

    @products = Item.includes(:categories).all

    unless params[:category] == "" || params[:category].nil?
      @products = @products.where(categories: { name: params[:category] })
    end

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
      @products = @products.where("items.name LIKE ?", "%#{params[:search]}%").or(@products.where("items.description LIKE ?", "%#{params[:search]}%"))
    end
    @products = @products.page(params[:page])
  end
end

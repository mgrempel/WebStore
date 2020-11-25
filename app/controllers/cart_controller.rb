class CartController < ApplicationController
  def view
    unless cookies[:cart].nil?
      cart = JSON.parse(cookies[:cart])

      unless params[:delete].nil?
        # Delete the specified item from our cart
        cart.delete(params[:delete])
        cookies[:cart] = cart.to_json
      end

      @cart = cart

      item_ids = []

      @cart.each do |k, _|
        item_ids.append(k)
      end

      @items = Item.find(item_ids)
    end
  end

  def add
    cart = {}
    cart = JSON.parse(cookies[:cart]) unless cookies[:cart].nil?

    # Determine if we're creating or adding to the cart.
    cart[params[:item_id]] = if cart[params[:item_id]].nil?
                               params[:amount].to_i
                             else
                               cart[params[:item_id]].to_i + params[:amount].to_i
                             end

    @item = Item.find(params[:item_id].to_i)
    @count = params[:amount].to_i
    @total = if @item.markdown.zero?
               @count * @item.price
             else
               @count * @item.markdown
             end

    cookies[:cart] = cart.to_json
  end
end

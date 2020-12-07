class CartController < ApplicationController
  def view
    unless cookies[:cart].nil?
      cart = JSON.parse(cookies[:cart])

      unless params[:update].nil?
        cart[params[:update]] = params[:update_amount].to_i
        cookies[:cart] = cart.to_json
      end

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

  def checkout
    if cookies[:cart].blank?
      redirect_to cart_view_path
    else
      cart = JSON.parse(cookies[:cart])
      item_ids = []

      cart.each do |k, _|
        item_ids.append(k)
      end

      # Let's create a new order with provided params
      # user = User.find(current_user.id)
      # user.orders.build(
      #   order_date:   DateTime.now,
      #   address_info: AddressInfo.find(params[:shipping].to_i)
      # )

      # order = Order.new(
      #   order_date:   DateTime.now,
      #   address_info: AddressInfo.find(params[:shipping].to_i),
      #   user:         user
      # )
      # order.save

      # Add each item to the order.
      # cart.each do |item|
      #   order.item
      # end
      tax_info = AddressInfo.find(params[:shipping].to_i).province
      @address_id = params[:shipping]
      @tax_rate = tax_info.gst + tax_info.pst + tax_info.hst
      @total = 0.00
      @cart = cart
      @items = Item.find(item_ids)
    end
  end

  def neworder
    user = User.find(current_user.id)
    @addresses = user.address_infos
  end

  def processorder
    # We need to add our cart contents to the order here, set it's status and persist all.
    puts params[:tax]
    puts params[:total]
    puts params[:address]

    # Grab our user
    user = User.find(current_user.id)

    # Create a new order.
    order = Order.create!(
      user:         user,
      order_date:   DateTime.now,
      address_info: AddressInfo.find(params[:address].to_i),
      tax_rate:     params[:tax].to_d,
      total:        params[:total].to_d
    )

    # Add our items to the order
    cart = JSON.parse(cookies[:cart])

    cart.each do |k, _|
      # Get our item
      current_item = Item.find(k)
      puts current_item.name

      current_price = if current_item.markdown != 0
                        current_item.markdown
                      else
                        current_item.price
                      end

      # order.order_items.build(
      #   item_id:    current_item.id,
      #   item_price: current_price
      # )

      order_item = OrderItem.new(
        item_id:    current_item.id,
        order_id:   order.id,
        item_price: current_price
      )

      order_item.save!
    end
    order.save!
  end
end

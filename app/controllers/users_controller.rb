class UsersController < ApplicationController
  def orders
    user = User.find(current_user.id)

    # Find our orders
    @orders = user.orders
  end
end

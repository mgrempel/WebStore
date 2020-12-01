class UserController < ApplicationController
  def address
    user = User.find(current_user.id)
    @addresses = user.address_infos
  end

  def create; end
end

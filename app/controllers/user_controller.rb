class UserController < ApplicationController
  def index
    user = User.find(current_user.id)
    @addresses = user.address_infos
  end

  def new
    @address.new
  end

  def article_params
    params.require(:address_info).permit(:address, :address2, :postal_code, :city, :provinces)
  end
end

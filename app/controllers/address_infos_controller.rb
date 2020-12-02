class AddressInfosController < ApplicationController
  def index
    user = User.find(current_user.id)
    @addresses = user.address_infos
  end

  def new
    @address = AddressInfo.new
    @provinces = Province.all
  end

  def create
    input = params[:address_info]
    @address = AddressInfo.new(address:     input[:address],
                               address2:    input[:address2],
                               postal_code: input[:postal_code],
                               city:        input[:city],
                               province:    Province.find(input[:province].to_i))

    user = User.find(current_user.id)

    user.address_infos << @address
    if user.save
      redirect_to address_infos_path
    else
      render "new"
    end
  end

  def address_params
    params.require(:address_info).permit(:address, :address2, :postal_code, :city, :province)
  end
end

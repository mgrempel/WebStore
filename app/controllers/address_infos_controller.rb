class AddressInfosController < ApplicationController
  def index
    user = User.find(current_user.id)
    @addresses = user.address_infos
  end

  def new
    @transition = params[:transition]
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
      if params[:transition].blank?
        redirect_to address_infos_path
      else
        redirect_to cart_neworder_path
      end
    else
      render "new"
    end
  end

  def destroy
    @address = AddressInfo.find(params[:id])
    @address.destroy

    redirect_to address_infos_path
  end

  def address_params
    params.require(:address_info).permit(:address, :address2, :postal_code, :city, :province, :transition)
  end
end

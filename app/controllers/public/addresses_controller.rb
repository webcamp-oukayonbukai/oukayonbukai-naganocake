class Public::AddressesController < ApplicationController
   before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path, notice: "You have created addressress successfully."
    else
      @address = Address.all
      render :index
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end
  
  private
  def address_params
    params.require(:address).permit(:postcode, :name, :address)
  end
end


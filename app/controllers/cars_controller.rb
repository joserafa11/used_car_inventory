class CarsController < ApplicationController
  before_action :check_admin, except: [:show]

  def show
    @car = Car.find(params[:id])
  end

  def new 
    @car = Car.new(dealership_id: params[:dealership_id])

  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to "/dealerships/#{@car.dealership_id}/cars"
    else
      render :new
    end
  end

  def edit 
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to "/dealerships/#{@car.dealership_id}/cars"
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to "/dealerships/#{@car.dealership_id}/cars"
  end


  private
  def car_params
    params.require(:car).permit(:description, :serial_number, :car_status, :original_price, :reception_date, :dealership_id)
  end
end

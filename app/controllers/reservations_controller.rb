class ReservationsController < ApplicationController
  #before_action :authenticate_account!

  def index
    @reservations = Reservation.all
  end

  def new
    @property = Property.all
    @reservation = Reservation.new
  end

  def create
    @property = Property.find(params[:id])
    @reservation = @property.reservations.new(reservation_params)
    @reservation.account = current_account

    if @reservation.save
      format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
      format.json { render :show, status: :created, location: @reservation }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @reservation.errors, status: :unprocessable_entity }
    end
  end


  private

  def set_property
    @property = Property.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

end

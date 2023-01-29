class ReservationsController < ApplicationController
  before_action :authenticate_account!

  def new
    @property = Property.find(params[:property_id])
    @reservation = @property.reservations.new
  end

  def create
    @property = Property.find(params[:property_id])
    @reservation = @property.reservations.new(reservation_params)
    @reservation.account = current_account

    if @reservation.save
      redirect_to @property, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

end

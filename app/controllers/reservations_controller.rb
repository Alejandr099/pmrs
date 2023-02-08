class ReservationsController < ApplicationController
  before_action :authenticate_account!

  def index
    @reservations = Reservation.all
  end

  def new
    @account = current_account.id
    @reservation = Reservation.new
    @property = Property.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @property = @reservation.property_id
    @reservation.account_id = current_account.id

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservations_url, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def total_price
    (end_date - start_date).to_i * property.price
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(
    :property_id,
      :start_date,
      :end_date
    )
  end

end

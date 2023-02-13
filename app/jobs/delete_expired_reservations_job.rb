
class DeleteExpiredReservationJob < ApplicationJob
  queue_as :default

  def perform(*)
    Reservation.where("end_date < ?", Time.now).destroy_all
  end
end

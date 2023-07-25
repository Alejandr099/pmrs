class DeleteExpiredReservationJob < ApplicationJob
  #include Sidekiq::Job
  queue_as :default

  def perform(reservation_id)
    reservation = Reservation.find_by(reservation_id)
    reservation.where("end_date < ?", Time.now).destroy_all
  end
end

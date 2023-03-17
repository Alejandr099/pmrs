class DeleteExpiredReservationJob < ApplicationJob
  include Sidekiq::Job
  queue_as :default

  def perform(*)
    Reservation.where("end_date < ?", Time.now).destroy_all
  end
end

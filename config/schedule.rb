
every :day, at: '12:00am' do
  runner "DeleteExpiredReservationJob.perform_now"
end


every :day, at: '1:00pm' do
  runner "DeleteExpiredReservationJob.perform_now"
end

class Reservation < ApplicationRecord
  belongs_to :property
  belongs_to :account

  validate :validates_dates

  private

  def validates_dates
    if (start_date && end_date) && (start_date > end_date)
      errors.add(:start_date, "must be before end date")
    end

    if (start_date && end_date) &&
        (property.reservations.where(start_date: start_date..end_date).on
        (property.reservations.where(end_date: start_date..end_date)).exists?)

      errors.add(:start_date, "This property is not available for the selected dates")
    end
  end

end

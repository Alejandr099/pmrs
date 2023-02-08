class Reservation < ApplicationRecord
  belongs_to :property
  belongs_to :account

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  #validate :cannot_reserve_own_property
  validate :no_collision


  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after start date")
    end
  end

  #def cannot_reserve_own_property
  #  if property.account_ids == current_account.id
  #    errors.add(:base, "Cannot reserve own property!")
  #  end
  #end

  def no_collision
    property.reservations.each do |existing_reservation|
      if (start_date - existing_reservation.end_date) * (existing_reservation.start_date - end_date) > 0
        errors.add(:base, "Collision with existing reservation. You should choose another days.")
      end
    end
  end
end

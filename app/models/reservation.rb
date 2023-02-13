class Reservation < ApplicationRecord
  belongs_to :property
  belongs_to :account

  validates :start_date, presence: true, inclusion: { in: (Date.today+1..Date.today+1.years) }
  validates :end_date, presence: true
  validate :not_own_property, on: :create
  validate :no_overlap_reservations
  validate :start_date_before_end_date
  validate :end_date_after_start_date

  def property_name
    property.try(:name)
  end

  def total_price
    "#{property.price * number_of_days} $"
  end

  private

  def start_date_before_end_date
    return if end_date.blank? || start_date.blank?

    if start_date >= end_date
      errors.add(:start_date, "must be before end date")
    end
  end

  def no_overlap_reservations
    overlap_reservations = Reservation.where(property_id: property_id)
                                      .where.not(id: id)
                                      .where("start_date <= ? AND end_date >= ?", end_date, start_date)
    if overlap_reservations.present?
      errors.add(:base, "This property is already reserved of selected dates")
    end
  end

  def number_of_days
    (end_date-start_date).to_i
  end

  def not_own_property
    if account.present? && property.account_id == account.id
      errors.add(:base, "Can't be reserved by owner")
    end
  end

  def end_date_after_start_date
    return if end_date.blank? && start_date.blank?

    if :start_date < :end_date
      errors.add(:end_date, "must be after start date")
    end
  end

end

class Property < ActiveRecord::Base
  has_many :reservations
  has_many :accounts, through: :reservations
  has_one_attached :photo
  belongs_to :account

  validates :name, length: {minimum: 4, max: 30}
  validates :address, length: {minimum: 4, max: 30}
  validates :price, length: {minimum: 1, max: 5}, :numericality => {:greater_than => 0}
  validates :rooms, length: {minimum: 1, max: 2}, :numericality => {:greater_than => 0}
  validates :bathrooms, length: {minimum: 1, max: 2}, :numericality => {:greater_than => 0}
  validates :parking_spaces, length: {minimum: 1, max: 2}, :numericality => {:greater_than => -1}
  validates :available_date, inclusion: { in: (Date.today..Date.today+2.years) }

  scope :latest, -> { order created_at:  :desc}
  scope :sold, -> { where status: "sold" }
  scope :for_sale, -> { order created_at:  :desc}
  scope :leased, -> { order created_at:  :desc}
  scope :for_rent, -> { order created_at:  :desc}

  def public_page
    if self.photo.present?
      self.photo.variant(resize: '350x250').processed
    else
      self.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'placeholder_villa.png')), filename: 'placeholder_villa.png')
    end
  end

  def latest_prop_photo
    self.photo.variant(resize: '300x200').processed
  end

  def banner
    self.photo.variant(resize: '100x75!').processed
  end

  def thumbnail
    self.photo.variant(resize: '100x100!').processed
  end
end

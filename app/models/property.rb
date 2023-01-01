#class Property < ApplicationRecord
class Property < ActiveRecord::Base #< ApplicationRecord
  has_one_attached :photo
  belongs_to :account

  scope :latest, -> { order created_at:  :desc}
  scope :sold, -> { where status: "sold" }
  scope :for_sale, -> { order created_at:  :desc}
  scope :leased, -> { order created_at:  :desc}
  scope :for_rent, -> { order created_at:  :desc}

  def public_page
    self.photo.variant(resize: '350x250').processed
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

#class Property < ApplicationRecord
class Property < ActiveRecord::Base #< ApplicationRecord
  has_one_attached :photo
  belongs_to :account

  scope :latest, -> { order created_at:  :desc}

  def public_page
      self.photo.variant(resize: '300x200!').processed
  end

  def banner
    self.photo.variant(resize: '100x75!').processed
  end

  def thumbnail
    self.photo.variant(resize: '100x100!').processed
  end
end

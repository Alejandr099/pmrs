#class Property < ApplicationRecord
class Property < ActiveRecord::Base
  has_one_attached :photo
  belongs_to :account

  def banner
    self.photo.variant(resize: '100x75!').processed
  end

  def thumbnail
    self.photo.variant(resize: '100x100!').processed
  end
end

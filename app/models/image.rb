class Image < ApplicationRecord
  require "dhash-vips"

  has_one_attached :photo

  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :photo, presence: true

  after_create :calc_fingerprint


  def calc_fingerprint
    file = SavesToTempFile.new(self).call
    fingerprint = DHashVips::DHash.calculate file.path
    file.unlink
    self.update(fingerprint: fingerprint)
  end
end

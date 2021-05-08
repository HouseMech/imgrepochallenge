class Image < ApplicationRecord
  require "dhash-vips"
  after_create_commit :calc_fingerprint
  #Keep this before the has_one_attached otherwise ActiveStorage's callback
  #will not have triggered by the time calc_fingerprint runs

  has_one_attached :photo

  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :photo, presence: true

  paginates_per 15

  def compare_to_image(image)
    distance = DHashVips::DHash.hamming Integer(self.fingerprint), Integer(image.fingerprint)
    if distance < 25
      return true
    else
      return false
    end
  end

  def photo_thumbnail
    self.photo.variant(resize: "200x200").processed
  end


  def calc_fingerprint
    file = SavesToTempFile.new(self).call
    fingerprint = DHashVips::DHash.calculate file.path
    file.unlink
    self.update(fingerprint: fingerprint)
  end
end

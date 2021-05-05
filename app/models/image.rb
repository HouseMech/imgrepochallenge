class Image < ApplicationRecord
  require "dhash-vips"
  after_create_commit :calc_fingerprint
  #Keep this before the has_one_attached otherwise ActiveStorage's callback
  #will not have triggered by the time calc_fingerprint runs

  has_one_attached :photo

  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :photo, presence: true




  def calc_fingerprint
    file = SavesToTempFile.new(self).call
    fingerprint = DHashVips::DHash.calculate file.path
    file.unlink
    self.update(fingerprint: fingerprint)
  end
end

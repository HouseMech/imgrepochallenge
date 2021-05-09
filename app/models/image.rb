class Image < ApplicationRecord
  has_one_attached :photo

  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :photo, presence: true

  paginates_per 15

  def photo_thumbnail
    self.photo.variant(resize: "200x200").processed
  end
end

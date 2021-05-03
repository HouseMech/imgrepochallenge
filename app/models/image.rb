class Image < ApplicationRecord
  has_one_attached :photo

  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :photo, presence: true


end

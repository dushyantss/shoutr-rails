# frozen_string_literal: true

class PhotoShout < ApplicationRecord
  has_one_attached :image

  validates :image, presence: true
  validate :correct_image_mime_type
  validate :image_size_within_range

  def thumb
    image.variant(resize_to_limit: [200, 200])
  end

  private

  def correct_image_mime_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png image/gif])
      errors.add(:image, 'Must be an image')
    end
  end

  def image_size_within_range
    errors.add(:image, 'Must be less than 10 MB') if image.attached? && image.byte_size > 10.megabytes
  end
end

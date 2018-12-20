# frozen_string_literal: true

class Image < ApplicationRecord
  has_one_attached :file
  validates_presence_of :file
  validates :file, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  DEFAULT_IMAGE_LIMIT = 10
  scope :random, -> { order(Arel.sql('random()')).limit(DEFAULT_IMAGE_LIMIT) }
end

# frozen_string_literal: true

class Play < ApplicationRecord
  validates_presence_of :counter, :img_url
  validates :counter, numericality: { only_integer: true,
                                      greater_than_or_equal_to: 1,
                                      less_than_or_equal_to: 10 }
end

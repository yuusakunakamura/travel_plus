# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :plan_tags, dependent: :destroy
end

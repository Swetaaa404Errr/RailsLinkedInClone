# frozen_string_literal: true

class Apply < ApplicationRecord
  belongs_to :job_navigation
  belongs_to :user
  has_one_attached :cv
  validates :cv, presence: true, content_type: [:pdf]
end

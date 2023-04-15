# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :job_navigation
  validates :body, presence: true
end

# frozen_string_literal: true

class Notify < ApplicationRecord
  belongs_to :user
  belongs_to :job_navigation
  scope :latest_first, -> { order(created_at: :desc) }
end

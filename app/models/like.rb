# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :job_navigation
  validates :user_id, uniqueness: { scope: :job_navigation_id }
end

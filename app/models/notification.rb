# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiable, polymorphic: true, dependent: :destroy
  scope :latest_first, -> { order(created_at: :desc) }
end

# frozen_string_literal: true

class Chat < ApplicationRecord
  before_create :confirm_participant
  belongs_to :user
  belongs_to :room
  after_create_commit { broadcast_append_to room }
  scope :latest_first, -> { order(created_at: :desc) }
  def confirm_participant
    return unless room.is_private

    is_participant = Participant.where(user_id: user.id, room_id: room.id).first
    throw :abort unless is_participant
  end
end

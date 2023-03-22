# frozen_string_literal: true

class AddExpirationTimeToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :expiration_time, :datetime
  end
end

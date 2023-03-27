# frozen_string_literal: true

class AddJobNameToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :job_name, :string
  end
end

# frozen_string_literal: true

class AddIndexToApplies < ActiveRecord::Migration[6.1]
  def change
    add_index :applies, :user_id, unique: true
  end
end

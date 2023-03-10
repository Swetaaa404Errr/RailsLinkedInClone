# frozen_string_literal: true

class AddIndexToLikes < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, %i[user_id job_navigation_id], unique: true
  end
end

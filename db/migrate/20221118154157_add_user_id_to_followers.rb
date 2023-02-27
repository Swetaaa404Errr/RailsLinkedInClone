# frozen_string_literal: true

class AddUserIdToFollowers < ActiveRecord::Migration[6.1]
  def change
    add_column :followers, :user_id, :integer
  end
end

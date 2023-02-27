# frozen_string_literal: true

class DropUserProfile < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_profiles
  end
end

# frozen_string_literal: true

class AddJobroleToUserProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :user_profiles, :jobrole, :string
  end
end

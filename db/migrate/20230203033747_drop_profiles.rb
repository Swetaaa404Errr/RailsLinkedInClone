# frozen_string_literal: true

class DropProfiles < ActiveRecord::Migration[6.1]
  def change
    drop_table :profiles
  end
end

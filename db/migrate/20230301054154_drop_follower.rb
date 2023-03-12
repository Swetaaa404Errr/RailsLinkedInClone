# frozen_string_literal: true

class DropFollower < ActiveRecord::Migration[6.1]
  def change
    drop_table :followers
  end
end

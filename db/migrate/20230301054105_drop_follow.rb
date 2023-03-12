# frozen_string_literal: true

class DropFollow < ActiveRecord::Migration[6.1]
  def change
    drop_table :follows
  end
end

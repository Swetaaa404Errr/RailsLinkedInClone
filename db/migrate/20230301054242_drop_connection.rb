# frozen_string_literal: true

class DropConnection < ActiveRecord::Migration[6.1]
  def change
    drop_table :connections
  end
end

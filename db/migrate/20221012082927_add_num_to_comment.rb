# frozen_string_literal: true

class AddNumToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :num, :string
  end
end

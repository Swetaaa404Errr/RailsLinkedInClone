# frozen_string_literal: true

class AddUserToApply < ActiveRecord::Migration[6.1]
  def change
    # add_reference :applies, :user, null: false, foreign_key: true
  end
end

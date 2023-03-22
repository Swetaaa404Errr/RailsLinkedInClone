# frozen_string_literal: true

class AddReferenceToApplies < ActiveRecord::Migration[6.1]
  def change
    add_reference :applies, :user, index: true
  end
end

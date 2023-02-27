# frozen_string_literal: true

class RemoveIndexFromApplies < ActiveRecord::Migration[6.1]
  def change
    remove_index :applies, coloumn: [:user_id], name: 'index_applies_on_user_id'
  end
end

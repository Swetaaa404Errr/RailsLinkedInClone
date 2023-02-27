# frozen_string_literal: true

class DropUserInf < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_infs
  end
end

# frozen_string_literal: true

class AddBioToUserAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :user_accounts, :bio, :string
  end
end

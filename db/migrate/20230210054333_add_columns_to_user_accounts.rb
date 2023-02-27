# frozen_string_literal: true

class AddColumnsToUserAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :user_accounts, :cv, :binary
    add_column :user_accounts, :picture, :binary
    add_column :user_accounts, :certificate, :binary
    add_column :user_accounts, :notification, :boolean
    add_column :user_accounts, :job, :string
  end
end

# frozen_string_literal: true

class AddColumnToUserAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :user_accounts, :cvdownload, :string
  end
end

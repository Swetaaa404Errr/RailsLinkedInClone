# frozen_string_literal: true

class RenameColumnsInUserAccount < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_accounts, :skiill, :skill
    rename_column :user_accounts, :orgganisation, :organisation
    rename_column :user_accounts, :qualificatioon, :qualification
    rename_column :user_accounts, :expericencee, :experience
  end
end

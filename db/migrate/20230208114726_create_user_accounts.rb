# frozen_string_literal: true

class CreateUserAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_accounts do |t|
      t.string :username
      t.string :gmail
      t.string :link
      t.string :qualificatioon
      t.string :expericencee
      t.string :orgganisation
      t.string :skiill
      t.string :notify
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_accounts, %i[user_id created_at]
  end
end

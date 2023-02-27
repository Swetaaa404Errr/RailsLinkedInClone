# frozen_string_literal: true

class CreateUserAccountAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_account_attachments do |t|
      t.integer :user_account_id
      t.string :certificate

      t.timestamps
    end
  end
end

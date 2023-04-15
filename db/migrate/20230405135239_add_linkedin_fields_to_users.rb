# frozen_string_literal: true

class AddLinkedinFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :linkedin_uid, :string
    add_column :users, :linkedin_token, :string
    add_column :users, :linkedin_token_expiry, :datetime
  end
end

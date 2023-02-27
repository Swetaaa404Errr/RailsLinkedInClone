# frozen_string_literal: true

class AddUserCertificatesToUserAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :user_accounts, :user_certificates, :binary
  end
end

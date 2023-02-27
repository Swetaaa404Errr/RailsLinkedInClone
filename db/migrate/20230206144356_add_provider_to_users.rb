# frozen_string_literal: true

class AddProviderToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :first_name, :string
    add_column :users, :last__name, :string
    add_column :users, :picture_url, :string
  end
end

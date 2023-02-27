# frozen_string_literal: true

class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :sending, references: :users
      t.references :sender, references: :users

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :friends, %i[user_id created_at]
  end
end

# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.string :username
      t.string :email
      t.string :profile
      t.string :qualification
      t.string :experience
      t.string :organisation
      t.string :skill
      t.boolean :notification
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_profiles, %i[user_id created_at]
  end
end

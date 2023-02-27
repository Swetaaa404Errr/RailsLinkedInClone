# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :email
      t.string :prof_link
      t.string :qualification
      t.string :experience
      t.string :organisation
      t.string :skills
      t.string :job_role
      t.string :notification
      t.string :cv
      t.string :image
      t.string :certificates
      t.boolean :exist, :boolean, default: false

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :profiles, %i[user_id created_at]
  end
end

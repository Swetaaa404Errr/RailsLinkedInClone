# frozen_string_literal: true

class CreateConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.references :connecting, references: :users
      t.references :connector, references: :users

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :connections, %i[user_id created_at]
  end
end

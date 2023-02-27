# frozen_string_literal: true

class CreateTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :texts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end

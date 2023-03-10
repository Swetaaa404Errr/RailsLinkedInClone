# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :body
      t.references :job_navigation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

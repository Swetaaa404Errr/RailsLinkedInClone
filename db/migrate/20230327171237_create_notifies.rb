# frozen_string_literal: true

class CreateNotifies < ActiveRecord::Migration[6.1]
  def change
    create_table :notifies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job_navigation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

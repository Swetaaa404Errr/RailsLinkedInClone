# frozen_string_literal: true

class CreateApplyJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :apply_jobs do |t|
      t.string :cvv, null: false
      t.references :user, null: false, foreign_key: true
      t.references :job_navigation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

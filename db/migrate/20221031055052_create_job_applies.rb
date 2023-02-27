# frozen_string_literal: true

class CreateJobApplies < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applies do |t|
      t.string :cv
      t.references :job_nav, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateApplies < ActiveRecord::Migration[6.1]
  def change
    create_table :applies do |t|
      t.string :cv
      t.references :job_navigation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateJobPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :job_positions do |t|
      t.string :jobdesignation, null: false

      t.timestamps
    end
  end
end

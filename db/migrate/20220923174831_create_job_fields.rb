# frozen_string_literal: true

class CreateJobFields < ActiveRecord::Migration[6.1]
  def change
    create_table :job_fields do |t|
      t.string :jobsection

      t.timestamps
    end
  end
end

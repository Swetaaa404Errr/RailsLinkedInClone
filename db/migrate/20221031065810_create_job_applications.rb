# frozen_string_literal: true

class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.string :cv

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateJobNavbars < ActiveRecord::Migration[6.1]
  def change
    create_table :job_navbars do |t|
      t.string :jobtitle
      t.string :jobdescription
      t.string :novac
      t.string :skill
      t.string :jobrole
      t.string :jobsector
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :job_navbars, %i[user_id created_at]
  end
end

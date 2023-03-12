# frozen_string_literal: true

class DropJobApplication < ActiveRecord::Migration[6.1]
  def change
    drop_table :job_applications
  end
end

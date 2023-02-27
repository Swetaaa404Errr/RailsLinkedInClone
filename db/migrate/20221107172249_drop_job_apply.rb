# frozen_string_literal: true

class DropJobApply < ActiveRecord::Migration[6.1]
  def change
    drop_table :job_applies
  end
end

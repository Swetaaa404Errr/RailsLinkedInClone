# frozen_string_literal: true

class DropApplyJob < ActiveRecord::Migration[6.1]
  def change
    drop_table :apply_jobs
  end
end

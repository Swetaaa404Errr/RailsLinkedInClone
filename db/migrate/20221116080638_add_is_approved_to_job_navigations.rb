# frozen_string_literal: true

class AddIsApprovedToJobNavigations < ActiveRecord::Migration[6.1]
  def change
    add_column :job_navigations, :is_approved, :boolean, default: false
  end
end

# frozen_string_literal: true

class RenameColumnInJobNavigation < ActiveRecord::Migration[6.1]
  def change
    rename_column :job_navigations, :novac, :vacancy
  end
end

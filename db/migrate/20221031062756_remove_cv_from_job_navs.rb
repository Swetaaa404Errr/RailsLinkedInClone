# frozen_string_literal: true

class RemoveCvFromJobNavs < ActiveRecord::Migration[6.1]
  def change
    remove_column :job_navs, :cv, :string
  end
end

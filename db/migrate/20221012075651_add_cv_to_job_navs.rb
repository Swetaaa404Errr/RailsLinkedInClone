# frozen_string_literal: true

class AddCvToJobNavs < ActiveRecord::Migration[6.1]
  def change
    add_column :job_navs, :cv, :string
  end
end

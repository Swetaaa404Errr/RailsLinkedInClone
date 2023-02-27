# frozen_string_literal: true

class AddIndexToJobNavs < ActiveRecord::Migration[6.1]
  def change
    add_column :job_navs, :user_id, :integer
  end
end

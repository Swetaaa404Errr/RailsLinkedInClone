# frozen_string_literal: true

class AddJobnameToNotify < ActiveRecord::Migration[6.1]
  def change
    add_column :notifies, :job_name, :string
  end
end

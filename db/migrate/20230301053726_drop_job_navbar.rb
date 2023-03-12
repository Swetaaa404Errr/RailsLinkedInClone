# frozen_string_literal: true

class DropJobNavbar < ActiveRecord::Migration[6.1]
  def change
    drop_table :job_navbars
  end
end

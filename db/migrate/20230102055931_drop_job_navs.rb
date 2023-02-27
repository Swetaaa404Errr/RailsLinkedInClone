# frozen_string_literal: true

class DropJobNavs < ActiveRecord::Migration[6.1]
  def change
    drop_table :job_navs
  end
end

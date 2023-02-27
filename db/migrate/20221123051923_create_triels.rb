# frozen_string_literal: true

class CreateTriels < ActiveRecord::Migration[6.1]
  def change
    create_table :triels do |t|
      t.string :name

      t.timestamps
    end
  end
end

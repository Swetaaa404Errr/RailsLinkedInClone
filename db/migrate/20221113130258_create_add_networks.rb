# frozen_string_literal: true

class CreateAddNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :add_networks, &:timestamps
  end
end

# frozen_string_literal: true

# adds a default false activated attribute to the user table
class AddActivatedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :activated, :boolean, default: false
  end
end

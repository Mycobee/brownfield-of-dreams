# frozen_string_literal: true

# adds a github login column to the users table

class AddGithubLoginToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :github_login, :string
  end
end

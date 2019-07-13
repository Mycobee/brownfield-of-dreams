# frozen_string_literal: true

class AddGithubEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :github_email, :string
  end
end

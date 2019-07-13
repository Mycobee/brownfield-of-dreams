# frozen_string_literal: true

# creates a tokens table with a token and a user ID as attributes
class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :github_token
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

# frozen_string_literal: true

# creates a friendships table with a friend id and a user id
class CreateFriendship < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.integer :friend_id

      t.timestamps
    end
  end
end

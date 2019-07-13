# frozen_string_literal: true

# creates a user video joins table with user id and video id attributes
class CreateUserVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_videos do |t|
      t.references :user, foreign_key: true
      t.references :video, foreign_key: true
      t.timestamps
    end
  end
end

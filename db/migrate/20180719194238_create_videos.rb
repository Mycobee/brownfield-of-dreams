# frozen_string_literal: true

# creates a video table with description, video id, and thumbnail attributes
class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_id
      t.string :thumbnail
    end
  end
end

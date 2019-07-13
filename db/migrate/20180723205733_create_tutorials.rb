# frozen_string_literal: true

# creates a tutorial table with title, description, thumbnail, playlist id,
# and classroom attributes
class CreateTutorials < ActiveRecord::Migration[5.2]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :description
      t.string :thumbnail
      t.string :playlist_id
      t.boolean :classroom, default: false

      t.timestamps
    end
  end
end

# frozen_string_literal: true

# adds an html_url attribute to the user table
class AddHtmlUrlToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :html_url, :string
  end
end

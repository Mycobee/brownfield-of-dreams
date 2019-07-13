# frozen_string_literal: true

require 'rails_helper'

feature 'as a visitor on the site' do
  scenario 'it allows me to visit the about page' do
    visit about_path
    expect(current_path).to eq(about_path)
  end
end

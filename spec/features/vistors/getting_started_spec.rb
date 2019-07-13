# frozen_string_literal: true

require 'rails_helper'

feature 'getting started' do
  scenario 'it is a functional page' do
    visit get_started_path
    expect(current_path).to eq(get_started_path)
  end
end

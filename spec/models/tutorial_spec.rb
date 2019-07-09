# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tutorial, type: :model do
	describe 'validations' do
		it { should validate_presence_of :title }
	end

	describe '#instance methods' do 
		it 'no_videos?' do
			tutorial = create(:tutorial)
			expect(tutorial.no_videos?).to eq(true)
		end
	end
end

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

		it 'add_default_video' do
			tutorial = create(:tutorial)
			tutorial.add_default_video
			expect(tutorial.videos.first.title).to eq("Tutorial Has No Videos")
			expect(tutorial.videos.first.description).to eq("")
		end
	end
end

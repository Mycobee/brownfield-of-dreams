# frozen_string_literal: true

require 'rails_helper'

describe Video, type: :model do
  describe 'relationships' do
    it { should have_many(:user_videos) }
    it { should have_many(:users).through(:user_videos) }
    it { should belong_to(:tutorial) }
  end

  describe 'validations' do
    it { should validate_presence_of :position }
  end

  describe 'instance methods' do
    it '#default_video?' do
      default_video = Video.new(title: 'Tutorial Has No Videos')
      expect(default_video.default_video?).to be_truthy
    end
  end
end

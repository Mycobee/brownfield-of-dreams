# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  before :each do
    @tutorial_1 = create(:tutorial)
    @tutorial_2 = create(:tutorial, classroom: true)
    @tutorial_1.videos << create(:video)
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it 'destroys dependant videos' do
      expect { @tutorial_1.destroy }.to change { Video.count }.by(-1)
    end
  end

  describe 'instance methods' do
    it '#no_videos?' do
      tutorial = create(:tutorial)
      expect(tutorial.no_videos?).to eq(true)
    end

    it '#add_default_video' do
      tutorial = create(:tutorial)
      tutorial.add_default_video
      expect(tutorial.videos.first.title).to eq('Tutorial Has No Videos')
      expect(tutorial.videos.first.description).to eq('')
    end

    it '#non_classroom?' do
      expect(@tutorial_1.non_classroom?).to be_truthy
    end
  end

  describe 'class methods' do
    it '.non_classroom' do
      expect(Tutorial.non_classroom.first).to eq(@tutorial_1)
    end
  end
end

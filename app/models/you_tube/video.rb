# frozen_string_literal: true

module YouTube
	#behavior module for youtube videos
  class Video
    attr_reader :thumbnail

    def initialize(data = {})
      @thumbnail = data[:items].first[:snippet][:thumbnails][:high][:url]
    end

    def self.by_id(id)
      new(YoutubeService.new.video_info(id))
    end
  end
end

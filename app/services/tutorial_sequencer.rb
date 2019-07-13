# frozen_string_literal: true

# this service will change the position of videos if needed

class TutorialSequencer
  def initialize(tutorial, sequenced_video_ids)
    @tutorial = tutorial
    @sequenced_video_ids = sequenced_video_ids
  end

  def run!
    update_position_if_changed!
  end

  private

  attr_reader :tutorial, :sequenced_video_ids

  def videos
    tutorial.videos.to_a
  end

  def update_position_if_changed!
    sequenced_video_ids.each.with_index(1) do |video_id, index|
      video_to_change = videos.find do |video|
        video.id == video_id.to_i
      end
      if video_to_change.position != index
        video_to_change.update(position: index)
      end
    end
  end
end

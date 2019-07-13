# frozen_string_literal: true

namespace :video do
  desc 'Add positions to nil values in video table'
  task :add_position, [:videos] => :environment do
    final_position = Video.order(position: :desc).first.position
    Video.all.each do |video|
      if video.position.nil?
        video.update(position: final_position + 1)
        final_position += 1
      end
    end
  end
end

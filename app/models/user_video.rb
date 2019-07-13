# frozen_string_literal: true

# a joins model between users and videos for bookmarking
class UserVideo < ApplicationRecord
  belongs_to :video, foreign_key: 'video_id'
  belongs_to :user, foreign_key: 'user_id'
end

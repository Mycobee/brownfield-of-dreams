# frozen_string_literal: true

class Video < ApplicationRecord
  has_many :user_videos
  has_many :users, through: :user_videos
  belongs_to :tutorial

  def default_video?
    title == 'Tutorial Has No Videos'
  end

  validates_presence_of :position
end

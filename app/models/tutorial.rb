# frozen_string_literal: true

# a tutorial model that has many videos and accepts tags
class Tutorial < ApplicationRecord
  has_many :videos, -> { order(position: :ASC) }, dependent: :destroy
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos
  validates_presence_of :title

  def self.non_classroom
    where(classroom: false)
  end

  def non_classroom?
    classroom == false
  end

  def no_videos?
    videos.empty?
  end

  def self.tag
    tagged_with(params[:tag]).paginate(page: params[:page], per_page: 5)
  end

  def add_default_video
    title = 'Tutorial Has No Videos'
    description = ''
    videos << Video.new(title: title, description: description)
  end
end

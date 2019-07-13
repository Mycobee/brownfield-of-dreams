# frozen_string_literal: true

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
		videos.size == 0
	end

	def add_default_video
		if no_videos?
			title = "Tutorial Has No Videos"
			description = ""
			videos << Video.new(title: title, description: description)
		end
	end
end


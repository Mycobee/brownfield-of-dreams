# frozen_string_literal: true

# a serializer for video objects
class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :position
end

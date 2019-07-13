# frozen_string_literal: true

# A serializer for tutorial objects
class TutorialSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :thumbnail, :videos

  def videos
    object.videos
  end
end

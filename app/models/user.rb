# frozen_string_literal: true

# a user model that stores names, tokens, and friendships
class User < ApplicationRecord
  has_one :token, dependent: :destroy
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_many :friendships
  has_many :friends, through: :friendships

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create
  validates_presence_of :first_name
  enum role: %i[default admin]
  has_secure_password

  def self.bookmarks(user)
    Tutorial.includes(:videos)
            .order(:position, :id)
            .where('videos.id' => user.videos)
            .references(:video)
  end
end

# frozen_string_literal: true

# friendship model as a self referental joins table to users
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end

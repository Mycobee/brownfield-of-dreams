# frozen_string_literal: true

# an entry storing tokens for users
class Token < ApplicationRecord
  belongs_to :user
end

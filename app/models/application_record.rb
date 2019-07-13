# frozen_string_literal: true

# base model that database models inherit from
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

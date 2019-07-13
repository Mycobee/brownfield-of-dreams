# frozen_string_literal: true

# a repository model storing a name and URL of a github repository
class Repository
  attr_reader :name, :html_url

  def initialize(attributes)
    @name = attributes[:name]
    @html_url = attributes[:html_url]
  end
end

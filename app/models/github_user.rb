# frozen_string_literal: true

# a model storing github login information
class GithubUser
  attr_reader :login,
              :html_url

  def initialize(attributes)
    @login = attributes[:login]
    @html_url = attributes[:html_url]
  end
end

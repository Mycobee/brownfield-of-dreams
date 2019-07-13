class InviteController < ApplicationController
  def new
  end

  def create
    invite = User.find_by()
    require 'pry'; binding.pry
  end
end

# frozen_string_literal: true

# Welcome controller for non users
class WelcomeController < ApplicationController
  def index
    @tutorials = if params[:tag]
                   Tutorial.non_classroom.tag
                 else
                   Tutorial.non_classroom.paginate(page: params[:page])
                 end
  end
end

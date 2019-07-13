# frozen_string_literal: true

# Welcome controller for non users
class WelcomeController < ApplicationController
  def index
    page = params[:page]
    @tutorials = if params[:tag]
                   Tutorial.non_classroom.paginate(page: page, per_page: 5)
                 else
                   Tutorial.non_classroom.paginate(page: page)
                 end
  end
end

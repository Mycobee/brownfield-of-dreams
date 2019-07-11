# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    if params[:tag]
      @tutorials = Tutorial.non_classroom.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 5)
    else
      @tutorials = Tutorial.non_classroom.paginate(page: params[:page])
    end
  end
end

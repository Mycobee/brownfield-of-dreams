# frozen_string_literal: true

# Tutorial controller for show and index
class TutorialsController < ApplicationController
  def show
    tutorial = Tutorial.find(params[:id])
    if current_user.nil? && !tutorial.non_classroom?
      return four_oh_four
    else
      @facade = TutorialFacade.new(tutorial, params[:video_id])
    end
  end

  def index
    @tutorials = if current_user.nil?
                   Tutorial.non_classroom
                 else
                   Tutorial.all
                 end
  end
end

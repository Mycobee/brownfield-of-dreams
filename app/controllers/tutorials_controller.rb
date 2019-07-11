# frozen_string_literal: true

class TutorialsController < ApplicationController
  def show
  	tutorial = Tutorial.find(params[:id])
		if current_user == nil && !tutorial.non_classroom?
			return four_oh_four
		else
  	  @facade = TutorialFacade.new(tutorial, params[:video_id])
  	end
	end

	def index
		if current_user == nil
			@tutorials = Tutorial.non_classroom
		else
			@tutorials = Tutorial.all
		end
	end	
end

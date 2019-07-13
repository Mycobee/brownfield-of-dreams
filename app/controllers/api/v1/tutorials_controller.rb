# frozen_string_literal: true

# Controller for API tutorials
class Api::V1::TutorialsController < ApplicationController
  def index
    render json: Tutorial.all
  end

  def show
    render json: Tutorial.find(params[:id])
  end
end

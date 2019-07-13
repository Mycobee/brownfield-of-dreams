# frozen_string_literal: true

# Controller for API videos
class Api::V1::VideosController < ApplicationController
  def index
    render json: Video.all
  end

  def show
    render json: Video.find(params[:id])
  end
end

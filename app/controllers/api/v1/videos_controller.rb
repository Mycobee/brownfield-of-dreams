# frozen_string_literal: true

class Api::V1::VideosController < ApplicationController
  def index
    render json: Video.all
  end

  def show
    render json: Video.find(params[:id])
  end
end

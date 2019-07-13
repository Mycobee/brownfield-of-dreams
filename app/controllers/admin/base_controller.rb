# frozen_string_literal: true

# base controller with require admin helper method
class Admin::BaseController < ApplicationController
  before_action :require_admin!

  def require_admin!
    four_oh_four unless current_user.admin?
  end
end

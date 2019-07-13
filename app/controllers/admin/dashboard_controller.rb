# frozen_string_literal: true

# Admin dashboard controller for admin show
class Admin::DashboardController < Admin::BaseController
  def show
    @facade = AdminDashboardFacade.new
  end
end

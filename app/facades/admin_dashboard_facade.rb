# frozen_string_literal: true

#This facade presents data for the admin dashboard view
class AdminDashboardFacade
  def tutorials
    Tutorial.all
  end
end

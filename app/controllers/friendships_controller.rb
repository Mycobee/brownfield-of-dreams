class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(html_url: params[:friend_html])
    if friend.nil?
      flash[:message] = "Invalid user ID, please try again"
    else
      Friendship.find_or_create_by(user_id: params[:user_id].to_i,friend_id: friend.id)
    end
    redirect_to dashboard_path
  end
end

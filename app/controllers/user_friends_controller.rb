class UserFriendsController < ApplicationController

  def create
    data = User.find(params[:friend])
    @data_user = Friendship.create(user_id: current_user.id, friend_id: data.id)
    flash[:notice] = "you started following #{data.first_name}"
    redirect_to my_friends_path
  end

  def destroy
    data = User.find(params[:id])
    datafriend = Friendship.where(user_id: current_user.id, friend_id: data.id).first
    datafriend.destroy
    flash[:notice] = "you have unfollowed #{data.first_name}"
    redirect_to my_friends_path
  end

end
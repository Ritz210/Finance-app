class UsersController < ApplicationController
  def my_portfolio
    @tracked = current_user.stocks
  end

  def my_friends
    @my_friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friend = User.new_lookup(params[:friend])
      @my_friends = current_user.friends
        if @friend
          render 'users/my_friends'
        else
          flash[:alert] = "Please enter a valid name to search"
          redirect_to my_friends_path
        end
    else
      flash[:alert] = "Please enter a name to search"
      redirect_to my_friends_path
    end
  end

  def show
    @user = User.find(params[:id])
    @tracked = @user.stocks
  end
end

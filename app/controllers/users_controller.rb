class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # p "*" * 50
    # p "user: "
    # p @user
    # p "group: "
    # p @group
    # p "params: "
    # p user_params
    # p "*" * 50
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_has_group_path(@user)
    else
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end

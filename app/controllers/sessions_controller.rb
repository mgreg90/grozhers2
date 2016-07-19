class SessionsController < ApplicationController
  def homepage
    redirect_to user_new_path and return if session[:user_id].nil?
    redirect_to group_has_group_path(@group) and return
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to group_has_group_path(@group)
    else
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end

  private
  def sessions_params
    params.require(:user).permit(:username, :password)
  end
end

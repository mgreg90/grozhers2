class SessionsController < ApplicationController
  def homepage
    @user = User.find(session[:user_id]) if session[:user_id]
    redirect_to new_session_path and return if @user.nil?
    redirect_to new_group_path and return if !@user.has_group?
    redirect_to group_path(@user.groups.first.id) and return
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_has_group_path(@user)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

  def navbar
  end

  private
  def sessions_params
    params.require(:user).permit(:username, :password)
  end
end

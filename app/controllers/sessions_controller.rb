class SessionsController < ApplicationController
  def homepage
    @user = User.find(session[:user_id]) if session[:user_id]
    redirect_to sessions_new_path and return if @user.nil?
    redirect_to group_new_path and return if !@user.has_group?
    redirect_to group_show_path(@user.groups.first) and return
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to group_has_group_path
    else
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end

  def navbar
  end

  private
  def sessions_params
    params.require(:user).permit(:username, :password)
  end
end

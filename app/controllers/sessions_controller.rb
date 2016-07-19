class SessionsController < ApplicationController
  def homepage
    p "*" * 50
    p session[:user_id]
    p "*" * 50
    redirect_to user_new_path and return if session[:user_id].nil?
    redirect_to group_index_path and return
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to group_index_path
    else
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end
end

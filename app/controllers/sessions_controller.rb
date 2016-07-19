class SessionsController < ApplicationController
  def homepage
    p "*" * 50
    p session[:user_id]
    p "*" * 50
    redirect_to user_new_path and return if session[:user_id].nil?
    redirect_to group_index_path and return
  end

  def new
  end

  def create
  end

  def destroy
  end
end

class GroupsController < ApplicationController

  def has_group
    @user = User.find(session[:user_id]) if session[:user_id]
    redirect_to group_new_path and return if @user.groups.length == 0
    redirect_to group_path(@user.groups.first) and return
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      redirect_to group_new_path
    end
  end

  def show
    @group = Group.find(params[:id])
    @items = @group.items
    # Left off here! Let's make this work!
  end

  def index
    @groups = Group.all
    # Write code that handles no group situation
    # Otherwise shows items in group
  end

  def drop_item(item_id)
    @group.drop_item(item_id)
  end

  private
  def group_params
    params.require(:group).permit(:id, :name)
  end
end
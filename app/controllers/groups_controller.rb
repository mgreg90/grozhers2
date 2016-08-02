class GroupsController < ApplicationController
  autocomplete :item, :name

  def has_group
    @user = User.find(session[:user_id]) if session[:user_id]
    redirect_to new_group_path and return if @user.groups.length == 0
    redirect_to group_path(@user.groups.first) and return
  end

  def new
    @group = Group.new
  end

  def create
    @user = User.find(session[:user_id])
    @group = Group.new(group_params)
    if @group.save
      @user.groups << @group
      redirect_to group_path(@group)
    else
      redirect_to new_group_path
    end
  end

  def show
    @group = Group.find(params[:id])
    @item = Item.new
    @items = @group.items
    # Left off here! Let's make this work!
  end

  def index
    @groups = Group.all
    # Write code that handles no group situation
    # Otherwise shows items in group
  end

  def drop_item
    @group = Group.find(params[:group_id])
    @item = Item.find(params[:id])
    @group.items.delete(@item)
    redirect_to group_path(@group)
  end

  def add_member
    @group = Group.find_by(name: group_params[:name])
    @user = User.find(session[:user_id])
    @group.users << @user
    if @group.save
      redirect_to group_path(@group)
    end
  end

  def drop_member
    @group = Group.find(params[:group_id])
    @user = User.find(session[:user_id])
    if @group.users.delete(@user)
      redirect_to new_group_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:id, :name)
  end
end

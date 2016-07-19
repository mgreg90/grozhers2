class GroupController < ApplicationController

  def has_group
    redirect_to group_new_path and return if @group.nil?
    redirect_to group_show_path and return if @group
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_show_path(@group)
    else
      redirect_to group_new_path
    end
  end

  def show
    @group = Group.find(params)
  end

  def index
    @groups = Group.all
    # Write code that handles no group situation
    # Otherwise shows items in group
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end

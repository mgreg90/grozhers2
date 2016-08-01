class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @group = Group.find(params[:group_id])
    if @item.save
      @group.items << @item
      redirect_to group_path(@group)
    else
      redirect_to new_group_item_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end

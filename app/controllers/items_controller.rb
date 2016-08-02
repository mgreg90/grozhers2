class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end

  def create
    if Item.exists?(name: item_params[:name])
      @item = Item.find_by(name: item_params[:name])
    else
      @item = Item.new(item_params)
    end
    @group = Group.find(params[:group_id])
    @group.items << @item
    if @item.save
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

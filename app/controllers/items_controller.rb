class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params)
  end

  def destroy
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end
end

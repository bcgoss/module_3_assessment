class Api::V1::ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status(201)
    else
      redirect_to :api_v1_items_path, status 500
    end
  end

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to :api_v1_items_path
  end
end

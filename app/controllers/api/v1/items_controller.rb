class Api::V1::ItemsController < ApplicationController
  def create

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

  end
end

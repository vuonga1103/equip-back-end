class ItemsController < ApplicationController
  def index
    items = Item.all

    render json: items
  end

  def show
    item = Item.find_by(id: params[:id])

    item ? (render json: item) : (render json: {error: "Item Not Found"})
  end
end

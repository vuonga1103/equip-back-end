class ItemsController < ApplicationController
  def index
    available_items = Item.all.select { |i| !i.sold }

    render json: available_items 
  end

  def show
    item = Item.find_by(id: params[:id])

    item ? (render json: item) : (render json: {error: "Item Not Found"})
  end
end

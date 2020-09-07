class ItemsController < ApplicationController
  before_action :authorized, only: [:update, :create]

  def index
    available_items = Item.all.select { |i| !i.sold }

    render json: available_items 
  end

  def show
    item = Item.find_by(id: params[:id])

    item ? (render json: item) : (render json: {error: "Item Not Found"})
  end

  def update
    @item = Item.find_by(id: params[:id])

    if @user.items.include?(@item)
      @item.update(sold: params[:sold])
      render json: @item
    else
      render json: { error: "You do no have permission to do this"}
    end

  end

  def create
    item = @user.items.create(item_params)

    photo = Cloudinary::Uploader.upload(params[:photo]) 
    
    item.update(photo: photo['url'], sold: false)

    render json: item
  end

  private
  def item_params
    params.permit(:name, :description, :condition, :price, :pickup, :shipping, :category, :photo, :latitude, :longitude)
  end

end

class ItemsController < ApplicationController
  before_action :authorized, only: [:create, :post_photo]

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
    @item.update(sold: params[:sold])
    
    render json: @item
  end

  def create
    item = @user.items.create(item_params)
    render json: item
  end

  def post_photo
    item = @user.items.last

    photo = Cloudinary::Uploader.upload(params[:photo])

    item.update(photo: photo['url'])

    render json: item
  end

  private
  def item_params
    params.permit(:name, :description, :condition, :price, :pickup, :shipping, :category, :photo)
  end

end

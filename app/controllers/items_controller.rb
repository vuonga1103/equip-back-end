class ItemsController < ApplicationController
 # Before methods update() and create() get called, Application#authorized() is ran; in Application#authorized(), we decode the token passed in via the request's header, find the user associated with the decoded token, and set the instance var of @user to that user. So therefore in update() and create(), we have access to @user which is the user authorized. 
  before_action :authorized, only: [:update, :create]

  # Render out all items that have not been sold to display in frontend / page
  def index
    available_items = Item.all.select { |i| !i.sold }
    render json: available_items 
  end

  # To display data for one particular item the user requested
  def show
    item = Item.find_by(id: params[:id])
    item ? (render json: item) : (render json: {error: "Item Not Found"})
  end

  # This method gets called when the user updates the sold status of the item. First the user gets authorized through ApplicationController methods. Then we find the item, checks to see if the item belongs to the user, if it does then update the sold column, and return the item
  def update
    @item = Item.find_by(id: params[:id])

    if @user.items.include?(@item)
      @item.update(sold: params[:sold])
      render json: @item
    else
      render json: { error: "You do no have permission to do this"}
    end
  end

  # Gets called when the user submits form to create a new item in frontend. User first gets authorized through ApplicationController methods.
  def create
    # Then we create a new item, associating it with the @user
    item = @user.items.create(item_params)

    # Then we use Cloudinary::Uploader.upload() method to upload the photo file passed in through params

    photo = Cloudinary::Uploader.upload(params[:photo]) 
    # Next we update the item with the URL we got back from the uploaded photo, we also want to set the sold attribute to false since this is a new item and therefore not yet sold
    item.update(photo: photo['url'], sold: false)

    # Then we render the item
    render json: item
  end

  private

  def item_params
    params.permit(:name, :description, :condition, :price, :pickup, :shipping, :category, :photo, :latitude, :longitude)
  end

end

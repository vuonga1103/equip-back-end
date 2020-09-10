class ItemsController < ApplicationController
 # Before methods update() and create() get called, Application#authorized() is ran; in Application#authorized(), we decode the token passed in via the request's header, find the user associated with the decoded token, and set the instance var of @user to that user. So therefore in update() and create(), we have access to @user which is the user authorized. 
  before_action :authorized, only: [:update, :create]

  # Render out all items that have not been sold to display in frontend / page
  def index
    @items = Item.filter_by_not_sold()

    @items = @items.filter_by_shipping() if params[:shipping]
    @items = @items.filter_by_pickup() if params[:pickup]
    @items = @items.filter_by_category(params[:category]) if params[:category]

    @items = @items.filter_by_condition(params[:condition]) if params[:condition]
    # @items = @items.limit(6).offset((params[:page].to_i - 1) * 6)
    @items = @items.slice(0, params[:page].to_i * 6)
    render json: @items
  end

  # Render out first x available items per specified params[:page] and params[:per-page]
  def specific_amounts
    available_items = Item.all.select { |i| !i.sold }
    # let's say params[:per_page] is 9...

    # if params[:page] is 1, then we should render out... available_items[0...9] which means elements at indices 0 to 8 (... means not including)

    page = params[:page].to_i
    # per_page = params[:per_page]

    render json: available_items.slice(0, page * 6)

    # we want to render out... available_items.slice(0, 9) => 0th index to 9th index, not including 9th index

    # available_items.slice(0, (page * per_page))
    # so first round, page is 1, per_page is 9
      # .slice(0, (1*9)) => .slice(0, 9)
    # second round, page is 2, per_page is 9
      # .slice(0, (2*9)) => .slice(0, 18)


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

  def filtering_params(params)
    params.slice(:shipping, :pickup, :category, :condition)
  end

end

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :condition, :price, :pickup, :shipping, :category, :photo, :sold, :user

  belongs_to :user
end

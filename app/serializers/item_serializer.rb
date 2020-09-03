class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :condition, :price, :pickup, :shipping, :category, :photo, :user

  belongs_to :user
end

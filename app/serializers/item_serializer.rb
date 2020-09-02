class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :condition, :price, :pickup, :shipping, :category, :photo
end

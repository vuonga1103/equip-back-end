class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :city, :state, :zip, :email, :items

  has_many :items
end

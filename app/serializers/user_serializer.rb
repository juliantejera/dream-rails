class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :distance
  has_many :photos, serializer: PhotoSerializer
end

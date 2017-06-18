class UserSerializer < ActiveModel::Serializer
  attributes :id, :distance
  has_many :photos, serializer: PhotoSerializer
end

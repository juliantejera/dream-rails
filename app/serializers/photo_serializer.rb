class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :order, :status, :url

  def url
    object.image&.url
  end

end

class ImageSerializer < ActiveModel::Serializer
  attributes :id, :image, :url
  has_one :collection
end

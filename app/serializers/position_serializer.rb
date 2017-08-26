class PositionSerializer < ActiveModel::Serializer
  attributes :id, :position
  has_one :image
  has_one :keyword
end

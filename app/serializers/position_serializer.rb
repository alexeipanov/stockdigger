class PositionSerializer < ActiveModel::Serializer
  attributes :id, :position, :image_id, :keyword_id, :created_at
  has_one :image
  has_one :keyword
end

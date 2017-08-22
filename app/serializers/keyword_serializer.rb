class KeywordSerializer < ActiveModel::Serializer
  attributes :id, :keyword
  has_one :collection
end

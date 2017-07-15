class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password
  root 'attributes'
end

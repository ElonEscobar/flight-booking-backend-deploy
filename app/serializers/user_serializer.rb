class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :gender, :age

  has_many :flights
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :gender, :age, :password_digest
end

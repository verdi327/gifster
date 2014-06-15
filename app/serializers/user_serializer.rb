class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email

  def url
    user_path(object)
  end
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
  has_many :friends

  def url
    user_path(object)
  end
end

class AuthUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :auth_token

  def auth_token
    token = AuthenticateUser.new(object.email, object.password).call
  end
  
  has_many :pets , through: :registrations
end

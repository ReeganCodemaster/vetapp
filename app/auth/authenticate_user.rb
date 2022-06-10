class AuthenticateUser
  def initialize(email, password, role='none')
    @email = email
    @password = password
    @role = role
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private
  def user
    user = User.find_by(email: @email)
    if user && user.authenticate(@password) && (user.role == @role || user.role == 'none')
      return user 
    end
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
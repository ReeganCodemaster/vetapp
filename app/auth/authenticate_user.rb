class AuthenticateUser
  def initialize(email, password, role)
    @email = email
    @password = password
    @role = role
  end

  def call(action)
    auth_token = JsonWebToken.encode(user_id: user(action).id) if user(action)
  end

  private
  def user(action)
    if action == 'signup'
      user = User.find_by(email: @email)
      if user && user.authenticate(@password) && user.role == @role
        return user 
      end
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    elsif action == 'signin'
      user = User.find_by(email: @email)
      if user && user.authenticate(@password)
        return user 
      end
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end
end
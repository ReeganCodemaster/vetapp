class AuthenticateUser
  def initialize(email, password, role='')
    @email = email
    @password = password
    @role = role
  end

  def call(action)
    user_info = user(action)
    auth_token = JsonWebToken.encode(user_id: user_info.id) if user_info
    {
      auth_token: auth_token,
      user: user_info
    }
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
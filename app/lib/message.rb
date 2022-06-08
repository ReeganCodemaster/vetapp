class Message
  def not_found(record = 'record')
    "Sorry #{record} not found"
  end

  def invalid_credentials
    'Invalid credentials'
  end

  def invalid_token
    'Invalid token'
  end

  def missing_token
    'Missing token'
  end

  def expired_token
    'Sorry, your token is expired.Please login to continue'
  end

  def unauthorized 
    'Unauthorized request'
  end

  def account_created
    'Account created succesfully'
  end

  def account_not_created
    'Account could not be created'
  end
end
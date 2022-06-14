class Message
  def self.not_found(record = 'record')
    "Sorry #{record} not found"
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.expired_token
    'Sorry, your token is expired.Please login to continue'
  end

  def self.unauthorized 
    'Unauthorized request'
  end

  def self.account_created
    'Account created succesfully'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.pet_created 
    'Pet created succesfully'
  end

  def self.registration_succesfull
    'Registration succesfull'
  end

  def self.registration_updated
    'Registration updated'
  end

  def self.appointment_succesfull
    'Appointment created succesfully'
  end

  def self.appointment_unsuccesfull
    'Appointment could not be created'
  end
end
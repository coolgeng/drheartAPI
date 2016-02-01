class User < ActiveRecord::Base
  # attr_accessible :name, :sex, :age, :phone1, :avatar  
  has_one :patient
  has_one :doctor
  has_one :session
  
  before_save :encrypt_password
    
  def self.authenticate(phone, password_digest)
      user = find_by_phone(phone)
      if user && user.password_digest == BCrypt::Engine.hash_secret(password_digest, user.password_salt)
        user
    else
      nil
    end
  end
        
  def encrypt_password
     if password_digest.present?
       self.password_salt = BCrypt::Engine.generate_salt
       self.password_digest = BCrypt::Engine.hash_secret(password_digest, password_salt)
     end
   end
end

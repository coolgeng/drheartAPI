class User < ActiveRecord::Base
  # attr_accessible :name, :sex, :age, :phone1, :avatar  
  has_one :patient
  has_one :doctor
  has_one :session
  
  before_save :encrypt_password
  
  include ApplicationHelper
  
      
  def self.authenticate(phone, password_digest)
      user = find_by_phone(phone)
      if user && user.password_digest == BCrypt::Engine.hash_secret(password_digest, user.password_salt)
        user
    else
      nil
    end
  end
  
  def self.verify_by_phone(phone, verifycode)
    user = User.where(phone: phone, verify_code: verifycode).first
  end
  
  def self.update_password_by_phone(phone, password)
    user = find_by_phone(phone)
    @user.update_attributes(params[:password_digest] => password)
  end

  def encrypt_password
     if password_digest.present?
       self.password_salt = BCrypt::Engine.generate_salt
       self.password_digest = BCrypt::Engine.hash_secret(password_digest, password_salt)
     end
   end
end

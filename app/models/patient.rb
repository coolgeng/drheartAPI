class Patient < ActiveRecord::Base
  has_many :heart_rate, dependent: :destroy
  has_many :incident, dependent: :destroy  
  # has_and_belongs_to_many :doctors
  has_many :doctor_patients
  has_many :doctors, :through => :doctor_patients
  has_many :message, dependent: :destroy
  belongs_to :user
  
end
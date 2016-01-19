class Doctor < ActiveRecord::Base
  has_many :doctor_patients
  has_many :patients, :through => :doctor_patients
  belongs_to :user
  
end
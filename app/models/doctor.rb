class Doctor < ActiveRecord::Base
  has_many :doctor_patients
  has_many :incident, dependent: :destroy  
  has_many :patients, :through => :doctor_patients
  has_many :message, dependent: :destroy
    
  belongs_to :user
  
  def self.search(query)
    where("name like ?", "%#{query}%")     
  end
  
end
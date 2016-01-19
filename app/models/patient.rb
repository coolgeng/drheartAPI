class Patient < ActiveRecord::Base
  has_many :heart_rate, dependent: :destroy
  has_many :incident, dependent: :destroy  
  has_and_belongs_to_many :doctors
  belongs_to :user
end
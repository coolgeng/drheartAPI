class User < ActiveRecord::Base
  # attr_accessible :name, :sex, :age, :phone1, :avatar
  has_many :heart_rate, dependent: :destroy
  has_one :patient
end

class User < ActiveRecord::Base
  # attr_accessible :name, :sex, :age, :phone1, :avatar  
  has_one :patient
end

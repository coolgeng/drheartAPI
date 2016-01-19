class Patient < ActiveRecord::Base
  has_many :heart_rate, dependent: :destroy
  belongs_to :user
end
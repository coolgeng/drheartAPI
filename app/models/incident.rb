class Incident < ActiveRecord::Base
  belongs_to :patient
end
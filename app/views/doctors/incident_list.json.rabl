object @doctor => :doctor
# attributes :state, :time, :desp, :doctor, :treat

child :incident do
  attributes :status, :time, :desp, :doctor_id, :treat, :state, :occurring_time, :patient_id
end


extends "success"
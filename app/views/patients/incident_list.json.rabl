object @patient => :patient
# attributes :state, :time, :desp, :doctor, :treat

child :incident do
  attributes :status, :time, :desp, :doctor_id, :treat, :state, :occurring_time
end

extends "error"
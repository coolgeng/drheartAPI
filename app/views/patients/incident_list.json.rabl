object false

child(@incidents => :incident_list) do
	attributes :status, :time, :desp, :doctor_id, :treat, :state, :occurring_time
end

extends "success"

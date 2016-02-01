collection @incidents => :incident_list
attributes :status, :time, :desp, :doctor_id, :treat, :state, :occurring_time

node(:error_code) {0}
node(:msg) {""}

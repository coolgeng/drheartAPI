object @doctor => :doctor
# attributes :state, :time, :desp, :doctor, :treat

child(:incident => :incident_list, :object_root => :follow) do

# child (@incident, :root => :entries, :object_root => :follow) do
  attributes :status, :time, :desp, :doctor_id, :treat, :state, :occurring_time, :patient_id
end


extends "success"
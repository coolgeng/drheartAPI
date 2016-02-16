object @incident
attributes :id, :status, :time, :desp, :treat, :state, :patient_id

node(:time) { |incidents| incidents.occurring_time }
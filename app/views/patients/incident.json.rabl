
attributes :status, :time, :desp, :doctor_id, :treat, :state

node(:time) { |incidents| incidents.occurring_time }
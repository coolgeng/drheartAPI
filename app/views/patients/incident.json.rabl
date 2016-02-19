
attributes :status, :time, :desp, :treat, :state

node(:time) { |incidents| incidents.occurring_time }
node(:doctor) { |incidents| incidents.doctor_name }


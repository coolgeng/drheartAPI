object @incident
attributes :id, :time, :desp, :treat, :state

node(:time) { |incidents| incidents.occurring_time }
node(:doctor) { |incidents| incidents.doctor_name }
node(:avatar) { |incidents| incidents.avatar }
node(:patient_id) { |incidents| incidents.user_id }
node(:name) { |incidents| incidents.name }
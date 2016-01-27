
object @patient => :patient

node :doctors do |doctor|
  doctor.doctors.to_a.map { |m| {:name => m.name, :id => m.id}}
end

extends "success"
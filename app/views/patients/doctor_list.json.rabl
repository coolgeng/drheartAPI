
object @patient => :patient

node :doctors do |doctor|
  doctor.doctors.to_a.map { |m| {:name => m.name, :id => m.id, :hospital => m.hospital, :sector => m.sector, :position => m.position, :avatar => m.avatar}}
end

extends "success"
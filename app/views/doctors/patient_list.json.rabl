
object @doctor => :doctor

node :patients do |patient|
  patient.patients.to_a.map { |m| {:name => m.name, :id => m.id, :sex => m.sex, :age => m.age, :phone => m.phone}}
end

extends "success"
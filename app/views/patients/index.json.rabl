collection @patients
attributes :id
child(:doctor) {attributes :name, id, status}
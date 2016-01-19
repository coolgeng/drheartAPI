collection @patients
attributes :id, :name, :phone, :avatar, :sex, :age
child(:doctor) {attributes :name}

object @patient => :patient
attributes :id, :name, :phone, :avatar, :sex, :age
# child(:doctor) {attributes :name}

extends "error"
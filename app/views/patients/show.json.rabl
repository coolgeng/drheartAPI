object @patient => :patient
attributes :name, :phone, :avatar, :sex, :age
# child(:doctor) {attributes :name}

extends "success"
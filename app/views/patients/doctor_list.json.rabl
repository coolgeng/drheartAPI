object @patient => :patient

child :doctor_patient do
  attributes :docotor_id, :status, :name, :id
end

extends "error"
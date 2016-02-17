object false

node(:error_code) {0}
node(:msg) {""}

child(@doctors => :doctor_list) do
	extends 'patients/doctor'
end


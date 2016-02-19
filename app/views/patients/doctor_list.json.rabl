
object false

node(:error_code) {0}
node(:msg) {""}

child(@doctors => :doctors) do
	extends 'patients/doctor'
end


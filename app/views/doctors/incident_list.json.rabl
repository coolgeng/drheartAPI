object false

node(:error_code) {0}
node(:msg) {""}

child(@incidents => :incident_list) do
	extends 'doctors/incident'
end


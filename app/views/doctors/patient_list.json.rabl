
object @doctor => :doctor

child(@patients => :patient_list) do
	extends	"doctors/patient"
end

extends "success"
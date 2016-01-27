object @patient => :patient

child :heart_rate do
  attributes :rate, :occurring_time
end

extends "success"
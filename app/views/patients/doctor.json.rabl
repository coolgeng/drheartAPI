
attributes :name, :hospital, :sector, :position, :avatar

node(:id) { |incidents| incidents.user_id }
node(:status) do |incidents|
  if incidents.status.nil?
    0
  else
    incidents.status
  end
end 



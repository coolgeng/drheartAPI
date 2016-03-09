
node(:id) { |incidents| incidents.user_id }
node(:name) { |incidents| incidents.name }
node(:hospital) { |incidents| incidents.hospital }
node(:sector) { |incidents| incidents.sector }
node(:position) { |incidents| incidents.position }
node(:avatar) { |incidents| incidents.avatar }
node(:status) do |incidents|
  if incidents.status.nil?
    0
  else
    incidents.status
  end
end 



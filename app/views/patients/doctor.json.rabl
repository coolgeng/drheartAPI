
attributes :name, :hospital, :sector, :position, :avatar, :status

node(:id) { |incidents| incidents.user_id }


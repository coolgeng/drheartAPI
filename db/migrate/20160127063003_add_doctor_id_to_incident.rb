class AddDoctorIdToIncident < ActiveRecord::Migration
  def change
    change_table :incidents do |t|
      # t.belongs_to :doctor, index: true
    end
    
  end
end

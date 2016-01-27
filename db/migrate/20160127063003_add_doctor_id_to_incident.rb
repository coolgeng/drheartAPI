class AddDoctorIdToIncident < ActiveRecord::Migration
  def change
    change_table :incidents do |t|
      t.remove :time
      t.belongs_to :doctor, index: true
    end
    
  end
end

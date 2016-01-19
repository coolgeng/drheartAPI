class DropDoctorPatientJoin < ActiveRecord::Migration
  def change
    drop_table :docotor_patient_joins
  end
end

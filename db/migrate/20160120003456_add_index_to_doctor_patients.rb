class AddIndexToDoctorPatients < ActiveRecord::Migration
  def change
    change_table :doctor_patients do |t|
      t.remove_index  name: :index_doctor_patients_on_patient_id
      t.remove_index  name: :index_doctor_patients_on_doctor_id
      add_index :doctor_patients, [:patient_id, :doctor_id], :unique => true
    end

  end
end

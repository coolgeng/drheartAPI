class AddIndexPatientDoctor < ActiveRecord::Migration
  def change
    change_table :patient_doctors do |t|
      add_index :patient_doctors, [:patient_id, :doctor_id]
    end
  end
end

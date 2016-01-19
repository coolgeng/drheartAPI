class CreateDoctorPatient < ActiveRecord::Migration
  def change
    create_table :doctor_patients, id: false do |t|
        t.belongs_to :patient, index: true
        t.belongs_to :doctor, index: true
        t.integer :status
        t.timestamps null: false
        # add_index :doctor_patients, [:patient_id, :doctor_id]
    end
  end
end

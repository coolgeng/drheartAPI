class CreatePatientDoctor < ActiveRecord::Migration
  def change
    create_table :patient_doctors, id: false do |t|
      t.belongs_to :patient, index: true
      t.belongs_to :doctor, index: true
    end
  end
end

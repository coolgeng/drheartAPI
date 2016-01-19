class AddStatusPatientDoctor < ActiveRecord::Migration
  def change
    change_table :patient_doctors do |t|
      t.integer :status
      t.timestamps null: false
    end    
  end
end

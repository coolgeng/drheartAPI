class ChangeHeartRate < ActiveRecord::Migration
  def change
    change_table :heart_rates do |t|
      t.belongs_to :patient, index: true
    end    
  end
end

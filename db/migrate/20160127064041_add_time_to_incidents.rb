class AddTimeToIncidents < ActiveRecord::Migration
  def change
    change_table :incidents do |t|
      t.integer :occurringTime, :limit => 8
    end    
  end
end

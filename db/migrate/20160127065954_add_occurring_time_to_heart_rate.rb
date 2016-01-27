class AddOccurringTimeToHeartRate < ActiveRecord::Migration
  def change
    change_table :heart_rates do |t|
      t.integer :occurringTime, :limit => 8
    end
  end
end
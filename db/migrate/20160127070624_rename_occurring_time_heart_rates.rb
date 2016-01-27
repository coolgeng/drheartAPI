class RenameOccurringTimeHeartRates < ActiveRecord::Migration
  def change
    change_table :heart_rates do |t|
      t.rename(:occurringTime, :occurring_time)
    end        
  end
end

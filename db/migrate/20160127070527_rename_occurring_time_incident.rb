class RenameOccurringTimeIncident < ActiveRecord::Migration
  def change
    change_table :incidents do |t|
      t.rename(:occurringTime, :occurring_time)
    end    
  end
end
